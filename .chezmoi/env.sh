#!/usr/bin/env sh

ANSI_RESET='\033[0m'

print_red() {
    ANSI_BRIGHT_RED='\033[91m'
    printf "${ANSI_BRIGHT_RED}%b\n${ANSI_RESET}" "$*"
}

print_green() {
    ANSI_BRIGHT_GREEN='\033[92m'
    printf "${ANSI_BRIGHT_GREEN}%b\n${ANSI_RESET}" "$*"
}

print_yellow() {
    ANSI_BRIGHT_YELLOW='\033[93m'
    printf "${ANSI_BRIGHT_YELLOW}%b\n${ANSI_RESET}" "$*"
}

print_blue() {
    ANSI_BRIGHT_BLUE='\033[94m'
    printf "${ANSI_BRIGHT_BLUE}%b\n${ANSI_RESET}" "$*"
}
