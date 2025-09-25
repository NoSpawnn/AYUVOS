#!/usr/bin/env bash

set -euxo pipefail

VOID_MKLIVE_DIR="$(dirname $(realpath $0))/void-mklive"
OUT_DIR="$VOID_MKLIVE_DIR/.."

ISO_NAME="ayuvos-$(date +%Y%m%d).iso"
ISO_SHELL="/bin/bash"
INCLUDE_DIR="$VOID_MKLIVE_DIR/../includedir"
LOCALE="$(locale | sed -n 's/^LANG=//p')"
BOOTLOADER_TITLE="AYUVOS"

PACKAGES_INSTALL=(
    # Core
    base-devel
    git
    podman
    incus
    qemu

    # CLI (and utilities)
    zsh
    vim
    xtools # https://github.com/leahneukirchen/xtools
    eza
    bat
    tealdeer
    zoxide
    just
)
PACKAGES_REMOVE=(
)
ISO_SERVICES=(
    NetworkManager
    dbus
    elogind
)

BUILD_CMD=(
    ./mkiso.sh
    -b "full"

    -- # mklive.sh args

    -o "$ISO_NAME"
    -l "$LOCALE"
    -k "us" # TODO: make keymap dynamic (in some sense)
    -I "$INCLUDE_DIR"
    -e "$ISO_SHELL"
    -p "\"${PACKAGES_INSTALL[@]}\""
    -g "\"${PACKAGES_REMOVE[@]}\""
    -S "\"${ISO_SERVICES[@]}\""
    -T "$BOOTLOADER_TITLE"
)

cd "$VOID_MKLIVE_DIR"

source ./lib.sh

if eval ${BUILD_CMD[@]}; then
    mv "$VOID_MKLIVE_DIR/$ISO_NAME" "$OUT_DIR"
fi
