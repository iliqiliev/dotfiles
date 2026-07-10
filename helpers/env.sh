export ANSI_RESET='\033[m'
export ANSI_BRIGHT_RED='\033[91m'
export ANSI_BRIGHT_GREEN='\033[92m'
export ANSI_BRIGHT_YELLOW='\033[93m'
export ANSI_BRIGHT_BLUE='\033[94m'
export ANSI_CURSOR_PREVIOUS_LINE='\033[F'
export ANSI_ERASE_IN_LINE='\033[K'

print_red() {
    printf "${ANSI_BRIGHT_RED}%b\n${ANSI_RESET}" "$*"
}

print_green() {
    printf "${ANSI_BRIGHT_GREEN}%b\n${ANSI_RESET}" "$*"
}

print_yellow() {
    printf "${ANSI_BRIGHT_YELLOW}%b\n${ANSI_RESET}" "$*"
}

print_blue() {
    printf "${ANSI_BRIGHT_BLUE}%b\n${ANSI_RESET}" "$*"
}
