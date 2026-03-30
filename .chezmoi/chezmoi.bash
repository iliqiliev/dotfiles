NORMAL='\033[0m'

function print_red() {
    RED='\033[31m'
    printf "${RED}%b\n${NORMAL}" "$*"
}

function print_green() {
    GREEN='\033[32m'
    printf "${GREEN}%b\n${NORMAL}" "$*"
}

function print_yellow() {
    YELLOW='\033[33m'
    printf "${YELLOW}%b\n${NORMAL}" "$*"
}

function print_blue() {
    BLUE='\033[34m'
    printf "${BLUE}%b\n${NORMAL}" "$*"
}
