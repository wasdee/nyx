#!/bin/bash
# GNOME settings setup script

# Enable dark mode
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# Set taskbar favorites
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'code.desktop', 'org.gnome.Terminal.desktop']"

echo "GNOME settings applied successfully!"