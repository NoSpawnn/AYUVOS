#!/usr/bin/env bash

set -euxo pipefail

# usage: join "<sep>" "<values>"
join() {
    local sep=$1
    shift
    if [ $# -ne 0 ]; then
        printf -- "$sep %s " "$@"
    else
        echo ""
    fi
}

VOID_MKLIVE_DIR="$(dirname $(realpath $0))/void-mklive"
OUT_DIR="$VOID_MKLIVE_DIR/.."

ISO_NAME="ayuvos-$(date +%Y%m%d).iso"
INCLUDE_DIR="$VOID_MKLIVE_DIR/../includedir"
LOCALE="$(locale | sed -n 's/^LANG=//p')"
DEFAULT_SHELL="/bin/bash"
BOOTLOADER_TITLE="AYUVOS"

PACKAGES_INSTALL=(
    # Core
    NetworkManager
    flatpak
    net-tools
    base-devel
    git
    podman
    incus

    # Drivers/firmware
    mesa-dri
    vulkan-loader
    mesa-vulkan-radeon
    mesa-vaapi
    mesa-vdpau

    # CLI (and utilities)
    zsh
    vim
    xtools # https://github.com/leahneukirchen/xtools
    eza
    bat
    tealdeer
    zoxide
    just

    # Desktop/GUI core
    sway # DE
    swaybg
    swaylock
    swayidle
    foot # Terminal
    Thunar # File manager (a GUI one is sometimes the only option)
    elogind
)
PACKAGES_REMOVE=(
    dhcpd
)
ISO_SERVICES=(
    NetworkManager
    dbus
    elogind
)

BUILD_CMD=(
    ./mklive.sh
    -o "$ISO_NAME"
    -l "$LOCALE"
    -k "us" # TODO: make keymap dynamic (in some sense)
    -I "$INCLUDE_DIR"
    -e "$DEFAULT_SHELL"
    $(join "-p" "${PACKAGES_INSTALL[@]}")
    $(join "-g" "${PACKAGES_REMOVE[@]}")
    $(join "-S" "${ISO_SERVICES[@]}")
    -T "$BOOTLOADER_TITLE"
)

cd "$VOID_MKLIVE_DIR"

source ./lib.sh

if eval ${BUILD_CMD[@]}; then
    mv "$VOID_MKLIVE_DIR/$ISO_NAME" "$OUT_DIR"
fi
