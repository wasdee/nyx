#!/bin/bash
# Setup dotfiles with GNU Stow

set -e

echo "Setting up dotfiles with GNU Stow..."

# Change to the dotfiles directory
cd "$(dirname "$0")/dotfiles"

# Backup existing files if they exist
if [ -f ~/.ssh/config ] && [ ! -L ~/.ssh/config ]; then
    echo "Backing up existing SSH config..."
    mv ~/.ssh/config ~/.ssh/config.backup
fi

# Stow all dotfile packages
echo "Installing SSH configuration..."
stow -t ~ ssh

echo "Installing XDG configuration..."
stow -t ~ xdg

echo "Applying GNOME settings..."
./gnome/setup-gnome.sh

echo "Dotfiles setup complete!"
echo ""
echo "To remove configurations later, run:"
echo "  cd dotfiles && stow -D -t ~ ssh"
echo "  cd dotfiles && stow -D -t ~ xdg"