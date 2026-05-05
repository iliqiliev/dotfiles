#!/usr/bin/env sh

ANSI_RESET='\033[m'
ANSI_BRIGHT_RED='\033[91m'
ANSI_BRIGHT_GREEN='\033[92m'
ANSI_BRIGHT_YELLOW='\033[93m'
ANSI_BRIGHT_BLUE='\033[94m'

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
