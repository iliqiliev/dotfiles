#!/usr/bin/env sh

NORMAL='\033[0m'

print_red() {
    RED='\033[31m'
    printf "${RED}%b\n${NORMAL}" "$*"
}

print_green() {
    GREEN='\033[32m'
    printf "${GREEN}%b\n${NORMAL}" "$*"
}

print_yellow() {
    YELLOW='\033[33m'
    printf "${YELLOW}%b\n${NORMAL}" "$*"
}

print_blue() {
    BLUE='\033[34m'
    printf "${BLUE}%b\n${NORMAL}" "$*"
}
