# shellcheck shell=sh

export ANSI_RESET='\033[m'
export ANSI_BRIGHT_RED='\033[91m'
export ANSI_BRIGHT_GREEN='\033[92m'
export ANSI_BRIGHT_YELLOW='\033[93m'
export ANSI_BRIGHT_BLUE='\033[94m'
export ANSI_CURSOR_PREVIOUS_LINE='\033[F'

print_color() {
    # -n: Do not apped a newline at the end of the message.

    color=$1
    shift

    end="\n"
    if test "$1" = "-n"; then
        end=""
        shift
    fi

    printf "${color}%b${end}${ANSI_RESET}" "$*"
}

print_red() { print_color "$ANSI_BRIGHT_RED" "$@"; }
print_green() { print_color "$ANSI_BRIGHT_GREEN" "$@"; }
print_yellow() { print_color "$ANSI_BRIGHT_YELLOW" "$@"; }
print_blue() { print_color "$ANSI_BRIGHT_BLUE" "$@"; }
