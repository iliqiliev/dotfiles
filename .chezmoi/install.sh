#!/bin/sh

set -eu # exit on [e]rror and [u]nset variables

NORMAL='\033[m'
RED='\033[91m'
GREEN='\033[92m'
BLUE='\033[94m'

cd

if ! chezmoi="$(command -v chezmoi)"; then
    host="get.chezmoi.io"
    chezmoi="${HOME}/.local/bin/chezmoi"
    chezmoi_dir="$(dirname "$chezmoi")"

    printf "${BLUE}%b\n${NORMAL}" "Downloading chezmoi to '${chezmoi_dir}' ..."

    if command -v curl >/dev/null; then
        chezmoi_script="$(curl -LSfs $host)"
    elif command -v wget >/dev/null; then
        chezmoi_script="$(wget -qO- $host)"
    elif command -v openssl >/dev/null; then
        chezmoi_script="$(printf 'GET / HTTP/1.0\nHost:%s\n\n' $host | openssl s_client -quiet $host:443 2>/dev/null)"
    else
        printf "${RED}%b\n${NORMAL}" "To install chezmoi, you must have curl or wget installed."
        exit 1
    fi

    BINDIR="$chezmoi_dir" sh -c "${chezmoi_script}"
fi

set -- init --apply iliqiliev --depth 1

printf "${GREEN}%b\n${NORMAL}" "Running 'chezmoi $*' ..."
exec "$chezmoi" "$@"
