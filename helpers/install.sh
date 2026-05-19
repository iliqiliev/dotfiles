#!/bin/sh

set -eu # exit on [e]rror and [u]nset variables

if ! CHEZMOI="$(command -v chezmoi)"; then
    CHEZMOI="${HOME}/.local/bin/chezmoi"
    CHEZMOI_DIR="$(dirname "${CHEZMOI}")"
    CHEZMOI_URL="https://get.chezmoi.io/"

    printf "\033[94m%b\n\033[m" "Downloading chezmoi to '${CHEZMOI_DIR}' ..."

    if command -v curl >/dev/null; then
        CHEZMOI_INSTALLER="$(curl -LSfs "${CHEZMOI_URL}")"
    elif command -v wget >/dev/null; then
        CHEZMOI_INSTALLER="$(wget -qO- "${CHEZMOI_URL}")"
    else
        printf "\033[91m%b\n\033[m" "To install chezmoi, you must have curl or wget installed."
        exit 1
    fi

    BINDIR="${CHEZMOI_DIR}" sh -c "${CHEZMOI_INSTALLER}"
fi

set -- init iliqiliev --apply --depth 1

printf "\033[92m%b\n\033[m" "Running 'chezmoi $*' ..."
"${CHEZMOI}" "$@"
