# Dotfiles managed with GNU Stow

This directory contains configuration files managed with GNU Stow.

## Usage

From the `/home/ben/Devs/nyx/mine` directory:

```bash
# Install all configurations
stow -t ~ dotfiles/*

# Install specific package
stow -t ~ dotfiles/ssh
stow -t ~ dotfiles/xdg

# Remove configurations
stow -D -t ~ dotfiles/*

# Apply GNOME settings (run after stowing)
./dotfiles/gnome/setup-gnome.sh
```

## Packages

- **ssh**: SSH client configuration with 1Password agent
- **xdg**: XDG MIME associations for default applications
- **gnome**: GNOME desktop settings script

## Migration from Home Manager

This replaces the previous Home Manager configuration with simple dotfiles and shell scripts.