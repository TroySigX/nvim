#!/bin/bash

if [[ $EUID -eq 0 ]]; then
    echo "This script must not be run as root"
    exit 1
fi

# Install system packages
packages=(
    "ripgrep"
    "xclip"
    "pandoc"
    "texlive-most"
    "bear"
)

for package in "${packages[@]}"; do
    if ! pacman -Qi "$package" > /dev/null 2>&1; then
        sudo pacman -S --noconfirm "$package"
    fi
done

# Symbolic link for editorconfig
ln -s $HOME"/.config/nvim/.editorconfig" "/mnt/HDD/.editorconfig"
