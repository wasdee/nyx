# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository ("nyx") contains two NixOS configurations:

1. **Main Configuration** (`/`): A comprehensive flake-based NixOS and Home Manager configuration for multiple machines
2. **Simplified Configuration** (`/mine`): A minimal traditional NixOS configuration for learning and experimentation

### Current Focus: `/mine` Directory
The `/mine` directory contains a simplified NixOS setup using traditional configuration files:
- **Hostname**: ben-laptop (Lenovo X1 Extreme with Intel iGPU + NVIDIA dGPU)
- **User**: ben
- **Desktop**: GNOME with Hyprland available
- **Special Hardware**: ZED SDK camera support with custom udev rules

## Common Commands

### For `/mine` Directory (Simplified Setup)
- `sudo nixos-rebuild switch`: Apply system configuration
- `sudo nixos-rebuild switch --specialisation on-the-go`: Switch to power-saving mode (NVIDIA Prime offload)
- `mise run test-zedsdk`: Test ZED SDK Docker setup with GPU passthrough

### For Main Configuration (Root Directory)
- `mise run n [machine]` or `mise run build-switch-nixos [machine]`: Build and switch NixOS configuration
- `mise run h [machine] [user]` or `mise run build-switch-homemanager [machine] [user]`: Build and switch Home Manager configuration
- `mise run all` or `mise run build-switch-nix-and-homemanager`: Build both NixOS and Home Manager
- `mise run upp`: Update all flake inputs
- `mise run up [targets]`: Update specific flake inputs
- `mise run gc`: Garbage collect old generations
- `mise run fmt`: Format all Nix files using treefmt

## Architecture

### `/mine` Directory Structure
- **`configuration.nix`**: Main system configuration with hardware-specific settings
- **`hardware-configuration.nix`**: Hardware scan results (auto-generated)
- **`home.nix`**: Home Manager integration and user-specific settings
- **`zed.nix`**: ZED SDK camera udev rules and hardware support

### Main Configuration Structure (Root Directory)
- **`/flake.nix`**: Main flake defining nixosConfigurations for machines and homeConfigurations for users
- **`/machines/`**: Machine-specific NixOS configurations (x1, kraken)
- **`/homes/`**: User-specific Home Manager configurations (orbit user)
- **`/misc/`**: Shared modules split into nixos/ and hm/ subdirectories
- **`/lib/`**: Custom library functions
- **`/secrets/`**: SOPS-encrypted secrets
- **`/assets/`**: Static resources (icons, themes, screenshots)

## Key Configuration Features

### Hardware Support
- **NVIDIA Prime**: Dual GPU setup with Intel iGPU + NVIDIA dGPU
- **Specialization**: "on-the-go" mode for battery-optimized NVIDIA offload
- **ZED Camera**: Custom udev rules for Stereolabs ZED SDK cameras
- **Docker + NVIDIA**: Container toolkit enabled for GPU passthrough

### Development Environment
- **Editors**: VS Code, Cursor, Windsurf, Zed, Helix
- **Shell**: Zsh with mise for tool management
- **Security**: 1Password with SSH agent integration
- **Version Control**: Git with LFS support

### Container Support
- **Docker**: Rootless mode enabled with NVIDIA container toolkit
- **ZED SDK Testing**: Pre-configured Docker command for camera testing

## Development Workflow

### Working with `/mine` Configuration
1. Edit configuration files directly (`configuration.nix`, `home.nix`, `zed.nix`)
2. Test changes with `sudo nixos-rebuild switch`
3. Use specializations for different hardware profiles

### ZED SDK Development
- Use `mise run test-zedsdk` to test camera setup
- Udev rules are automatically applied from `zed.nix`
- Docker containers have GPU access for development

## Notes
- The `/mine` directory represents a learning approach: "start small from `/etc/nixos` to `./mine`"
- Main configuration uses flakes and modular architecture for production setups
- Current development focuses on the simplified `/mine` setup for experimentation