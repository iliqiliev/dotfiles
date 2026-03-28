#!/usr/bin/env bash

set -eu

echo -e "${BLUE}Setting up GNOME extensions...${NORMAL}"

if ! command -v gnome-extensions-cli >/dev/null; then
    echo -e "${BLUE}'gnome-extensions-cli' is not installed. Installing it...${NORMAL}"

    if ! command -v uv >/dev/null; then
        echo -e "${RED}'uv' is not installed. Aborting.${NORMAL}"
        exit 0
    fi

    uv tool install gnome-extensions-cli --with-requirements /dev/stdin <<<"pygobject"
    echo -e "${GREEN}'gnome-extensions-cli' installed successfully.${NORMAL}"
fi

if gnome-extensions-cli --dbus &>/dev/null; then
    gext_args=("--dbus")
else
    gext_args=("--filesystem")
fi

extensions=(
    "AlphabeticalAppGrid@stuarthayhurst"          # Alphabetical App Grid
    "app-hider@lynith.dev"                        # App Hider
    "appindicatorsupport@rgcjonas.gmail.com"      # AppIndicator and KStatusNotifierItem Support
    "disable-menu-switching@selfmade.pl"          # Disable Menu Switching
    "middleclickclose@paolo.tranquilli.gmail.com" # Quick Close in Overview
    "panelScroll@sun.wxg@gmail.com"               # Panel Scroll
)

gnome-extensions-cli "${gext_args[@]}" install "${extensions[@]}"

if test "${gext_args[0]}" = "--filesystem"; then
    echo -e "${YELLOW}Re-log to apply changes.${NORMAL}"
fi

echo -e "${GREEN}GNOME extensions set up successfully.${NORMAL}"
