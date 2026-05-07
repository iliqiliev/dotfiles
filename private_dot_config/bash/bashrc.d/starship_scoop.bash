# shellcheck disable=all

STARSHIP_SCOOP_PATH=~/scoop/apps/starship/current/starship.exe

if test ! -x $STARSHIP_SCOOP_PATH >/dev/null; then
    return
fi

function _starship_set_return() { return "${1:-0}"; }

starship_preexec() {

    local PREV_LAST_ARG=$1

    if [ "${STARSHIP_PREEXEC_READY:-}" = "true" ]; then
        STARSHIP_PREEXEC_READY=false
        STARSHIP_START_TIME=$($STARSHIP_SCOOP_PATH time)
    fi

    : "$PREV_LAST_ARG"
}

starship_precmd() {
    STARSHIP_CMD_STATUS=$? STARSHIP_PIPE_STATUS=("${PIPESTATUS[@]}")
    if [[ ${BLE_ATTACHED-} && ${#BLE_PIPESTATUS[@]} -gt 0 ]]; then
        STARSHIP_PIPE_STATUS=("${BLE_PIPESTATUS[@]}")
    fi
    if [[ -n "${BP_PIPESTATUS-}" ]] && [[ "${#BP_PIPESTATUS[@]}" -gt 0 ]]; then
        STARSHIP_PIPE_STATUS=("${BP_PIPESTATUS[@]}")
    fi

    jobs &>/dev/null

    local job NUM_JOBS=0 IFS=$' \t\n'

    for job in $(jobs -p); do [[ $job ]] && ((NUM_JOBS++)); done

    "${starship_precmd_user_func-:}"

    _starship_set_return "$STARSHIP_CMD_STATUS"

    if [[ -n "${STARSHIP_PROMPT_COMMAND-}" ]]; then
        eval "$STARSHIP_PROMPT_COMMAND"
    fi

    local -a ARGS=(--terminal-width="${COLUMNS}" --status="${STARSHIP_CMD_STATUS}" --pipestatus="${STARSHIP_PIPE_STATUS[*]}" --jobs="${NUM_JOBS}" --shlvl="${SHLVL}")

    if [[ -n "${STARSHIP_START_TIME-}" ]]; then
        STARSHIP_END_TIME=$($STARSHIP_SCOOP_PATH time)
        STARSHIP_DURATION=$((STARSHIP_END_TIME - STARSHIP_START_TIME))
        ARGS+=(--cmd-duration="${STARSHIP_DURATION}")
        STARSHIP_START_TIME=""
    fi
    PS1="$($STARSHIP_SCOOP_PATH prompt "${ARGS[@]}")"
    if [[ ${BLE_ATTACHED-} ]]; then
        local nlns=${PS1//[!$'\n']/}
        bleopt prompt_rps1="$nlns$($STARSHIP_SCOOP_PATH prompt --right "${ARGS[@]}")"
    fi
    STARSHIP_PREEXEC_READY=true
}

# If the user appears to be using https://github.com/akinomyoga/ble.sh,
# then hook our functions into their framework.
if [[ ${BLE_VERSION-} && _ble_version -ge 400 ]]; then
    blehook PREEXEC!='starship_preexec "$_"'
    blehook PRECMD!='starship_precmd'
# If the user appears to be using https://github.com/rcaloras/bash-preexec,
# then hook our functions into their framework.
elif [[ -n "${bash_preexec_imported:-}" || -n "${__bp_imported:-}" || -n "${preexec_functions-}" || -n "${precmd_functions-}" ]]; then
    # bash-preexec needs a single function--wrap the args into a closure and pass
    starship_preexec_all() { starship_preexec "$_"; }
    preexec_functions+=(starship_preexec_all)
    precmd_functions+=(starship_precmd)
else
    if [[ -n "${BASH_VERSION-}" ]] && [[ "${BASH_VERSINFO[0]}" -gt 4 || ("${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4) ]]; then
        starship_preexec_ps0() {
            $STARSHIP_SCOOP_PATH time
        }
        # In order to set STARSHIP_START_TIME use an arithmetic expansion that evaluates to 0
        # To avoid printing anything, use the return value in an ${var:offset:length} substring expansion
        # with offset and length evaluating to 0.
        PS0='${STARSHIP_START_TIME:$((STARSHIP_START_TIME="$(starship_preexec_ps0)",STARSHIP_PREEXEC_READY=0,0)):0}'"${PS0-}"
    else
        # We want to avoid destroying an existing DEBUG hook. If we detect one, create
        # a new function that runs both the existing function AND our function, then
        # re-trap DEBUG to use this new function. This prevents a trap clobber.
        eval "STARSHIP_DEBUG_TRAP=($(trap -p DEBUG))"
        STARSHIP_DEBUG_TRAP=("${STARSHIP_DEBUG_TRAP[2]}")
        if [[ -z "$STARSHIP_DEBUG_TRAP" ]]; then
            trap 'starship_preexec "$_"' DEBUG
        elif [[ "$STARSHIP_DEBUG_TRAP" != 'starship_preexec "$_"' && "$STARSHIP_DEBUG_TRAP" != 'starship_preexec_all "$_"' ]]; then
            starship_preexec_all() {
                local PREV_LAST_ARG=$1
                eval -- "$STARSHIP_DEBUG_TRAP"
                starship_preexec
                : "$PREV_LAST_ARG"
            }
            trap 'starship_preexec_all "$_"' DEBUG
        fi
    fi

    # Finally, prepare the precmd function and set up the start time. We will avoid to
    # add multiple instances of the starship function and keep other user functions if any.
    if [[ -z "${PROMPT_COMMAND-}" ]]; then
        PROMPT_COMMAND="starship_precmd"
    elif [[ "$PROMPT_COMMAND" != *"starship_precmd"* ]]; then
        # Appending to PROMPT_COMMAND breaks exit status ($?) checking.
        # Prepending to PROMPT_COMMAND breaks "command duration" module.
        # So, we are preserving the existing PROMPT_COMMAND
        # which will be executed later in the starship_precmd function
        STARSHIP_PROMPT_COMMAND="$PROMPT_COMMAND"
        PROMPT_COMMAND="starship_precmd"
    fi
fi

# Ensure that $COLUMNS gets set
shopt -s checkwinsize

# Set up the start time and STARSHIP_SHELL, which controls shell-specific sequences
STARSHIP_START_TIME=$($STARSHIP_SCOOP_PATH time)
export STARSHIP_SHELL="bash"

# Set up the session key that will be used to store logs
STARSHIP_SESSION_KEY="$RANDOM$RANDOM$RANDOM$RANDOM$RANDOM"     # Random generates a number b/w 0 - 32767
STARSHIP_SESSION_KEY="${STARSHIP_SESSION_KEY}0000000000000000" # Pad it to 16+ chars.
export STARSHIP_SESSION_KEY=${STARSHIP_SESSION_KEY:0:16}       # Trim to 16-digits if excess.

# Set the continuation prompt
PS2="$($STARSHIP_SCOOP_PATH prompt --continuation)"
