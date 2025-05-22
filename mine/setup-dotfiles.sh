#!/bin/bash
# Setup dotfiles with GNU Stow

set -e

echo "Setting up dotfiles with GNU Stow..."

# Change to the mine directory
cd "$(dirname "$0")"

# Stow all dotfile packages
echo "Installing SSH configuration..."
stow -t ~ dotfiles/ssh

echo "Installing XDG configuration..."
stow -t ~ dotfiles/xdg

echo "Applying GNOME settings..."
./dotfiles/gnome/setup-gnome.sh

echo "Dotfiles setup complete!"
echo ""
echo "To remove configurations later, run:"
echo "  stow -D -t ~ dotfiles/ssh"
echo "  stow -D -t ~ dotfiles/xdg"