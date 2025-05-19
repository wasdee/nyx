# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository ("nyx") is a personal NixOS and Home Manager configuration using Nix flakes. It declaratively manages system-level configurations for multiple machines and user environments.

### Machines
- **x1**: Lenovo X1 Carbon Gen 9 (laptop)
- **kraken**: Custom desktop with Ryzen 5 3600 and RTX 2060

## Common Commands

### System Management
- `mise run n [machine]` or `mise run build-switch-nixos [machine]`: Build and switch NixOS configuration
- `mise run h [machine] [user]` or `mise run build-switch-homemanager [machine] [user]`: Build and switch Home Manager configuration
- `mise run all` or `mise run build-switch-nix-and-homemanager`: Build both NixOS and Home Manager

### Flake Management
- `mise run upp`: Update all flake inputs
- `mise run up [targets]`: Update specific flake inputs (e.g., `mise run up nixpkgs home-manager`)

### Maintenance
- `mise run gc`: Garbage collect old generations (both user and system)
- `mise run fmt`: Format all Nix files using treefmt

## Architecture

The configuration is organized as follows:

- **`/flake.nix`**: Main flake defining nixosConfigurations for machines and homeConfigurations for users
- **`/machines/`**: Machine-specific NixOS configurations
  - Each machine has its own directory with hardware config, services, and specific modules
- **`/homes/`**: User-specific Home Manager configurations (currently only "orbit" user)
- **`/misc/`**: Shared modules split into:
  - `nixos/`: System-level modules (apps, common, hardware)
  - `hm/`: Home Manager modules (browsers, desktops, media, shells, terminals, etc.)
- **`/lib/`**: Custom library functions
- **`/secrets/`**: SOPS-encrypted secrets for each machine and user
- **`/assets/`**: Static resources (icons, Plymouth themes, screenshots)

### Desktop Environment
Uses Hyprland as the primary window manager with machine-specific configurations in `/misc/hm/desktops/hyprland/device/`.

## Key Configuration Patterns

### Creating New Machine Configurations
1. Add machine directory under `/machines/`
2. Create `default.nix` importing hardware-configuration.nix and relevant modules
3. Add entry to flake.nix under `nixosConfigurations`
4. Add corresponding Home Manager configuration under `homeConfigurations`

### Home Manager Modules
Modules in `/misc/hm/` are typically structured with:
- `default.nix`: Module entry point with options definition
- Config files in subdirectories when needed
- Machine-specific overrides in `device/` subdirectories

### Secrets Management
SOPS is used for secret management. Secrets are stored in `/secrets/` as YAML files per machine/user.

## Development Notes
- Forked a Nix config repo, learning the structure and trying to adapt it to my liking

## Workflow Notes
- Let start small from `/etc/nixos` to `./mine`