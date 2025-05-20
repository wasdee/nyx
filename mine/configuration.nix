# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’). 

{ config, pkgs, lib, ... }:

# let
#   nix-software-center = import (pkgs.fetchFromGitHub {
#     owner = "snowfallorg";
#     repo = "nix-software-center";
#     rev = "0.1.2";
#     sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
#   }) {};
# in
{
  imports =
    [ # Include the results of the hardware scan.
      <nixos-hardware/lenovo/thinkpad/x1-extreme>
      ./hardware-configuration.nix
      ./home.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "ben-laptop"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Bangkok";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "th_TH.UTF-8";
    LC_IDENTIFICATION = "th_TH.UTF-8";
    LC_MEASUREMENT = "th_TH.UTF-8";
    LC_MONETARY = "th_TH.UTF-8";
    LC_NAME = "th_TH.UTF-8";
    LC_NUMERIC = "th_TH.UTF-8";
    LC_PAPER = "th_TH.UTF-8";
    LC_TELEPHONE = "th_TH.UTF-8";
    LC_TIME = "th_TH.UTF-8";
  };


  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia.open = true;  # see the note above
  # https://wiki.nixos.org/wiki/NVIDIA#Disabling
  hardware.nvidia.prime = {
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
    #amdgpuBusId = "PCI:54:0:0"; # If you have an AMD iGPU
  };
  specialisation.on-the-go.configuration = {
    system.nixos.tags = [ "on-the-go" ];
    hardware.nvidia.prime = {
      offload = {
        enable = lib.mkForce true;
        enableOffloadCmd = lib.mkForce true;
      };
      sync.enable = lib.mkForce false;    
    };
  };
  # TODO: https://wiki.nixos.org/wiki/CUDA


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false; # Changed from hardware.pulseaudio
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ben = {
    isNormalUser = true;
    description = "ben";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
    #  thunderbird
      vscode
      mqtt-explorer
      windsurf
      code-cursor
      microsoft-edge
      zed-editor
      helix
      helix-gpt
      #teams
    ];
  };

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "ben" ];
  };
  # ref https://discourse.nixos.org/t/1password-unlocking-browser-extension-issues-firefox-brave-edge-vs-vivaldi-wavebox/38216/3
  #  home-manager.users.ben = {
  #     home.file.".config/autostart/1password-startup.desktop".source = "${dotfiles}/autostart/1password-startup.desktop";
  #   };

    environment.etc = {
      "1password/custom_allowed_browsers" = {
        text = ''
          vivaldi-bin
        '';
        mode = "0755";
      };
    };
  programs.firefox = {
      enable = true;
      # languagePacks = [ "de" "en-US" ];

      /* ---- POLICIES ---- */
      # Check about:policies#documentation for options.
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
        EnableTrackingProtection = {
          Value= true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        DisablePocket = true;
        # DisableFirefoxAccounts = true;
        # DisableAccounts = true;
        # DisableFirefoxScreenshots = true;
        # OverrideFirstRunPage = "";
        # OverridePostUpdatePage = "";
        # DontCheckDefaultBrowser = true;
        # DisplayBookmarksToolbar = "never"; # alternatives: "always" or "newtab"
        DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"

        /* ---- EXTENSIONS ---- */
        # Check about:support for extension/add-on ID strings.
        # Valid strings for installation_mode are "allowed", "blocked",
        # "force_installed" and "normal_installed".
        ExtensionSettings = {
          # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below
          # # uBlock Origin:
          # "uBlock0@raymondhill.net" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          #   installation_mode = "force_installed";
          # };
          # # Privacy Badger:
          # "jid1-MnnxcxisBPnSXQ@jetpack" = {
          #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
          #   installation_mode = "force_installed";
          # };
          # 1Password:
          "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
            install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
            installation_mode = "force_installed";
          };
        };
  
        /* ---- PREFERENCES ---- */
        # Check about:config for options.
        Preferences = { 
          # "browser.contentblocking.category" = { Value = "strict"; Status = "locked"; };
          # "extensions.pocket.enabled" = lock-false;
          # "extensions.screenshots.disabled" = lock-true;
          # "browser.topsites.contile.enabled" = lock-false;
          # "browser.formfill.enable" = lock-false;
          # "browser.search.suggest.enabled" = lock-false;
          # "browser.search.suggest.enabled.private" = lock-false;
          # "browser.urlbar.suggest.searches" = lock-false;
          # "browser.urlbar.showSearchSuggestionsFirst" = lock-false;
          # "browser.newtabpage.activity-stream.feeds.section.topstories" = lock-false;
          # "browser.newtabpage.activity-stream.feeds.snippets" = lock-false;
          # "browser.newtabpage.activity-stream.section.highlights.includePocket" = lock-false;
          # "browser.newtabpage.activity-stream.section.highlights.includeBookmarks" = lock-false;
          # "browser.newtabpage.activity-stream.section.highlights.includeDownloads" = lock-false;
          # "browser.newtabpage.activity-stream.section.highlights.includeVisited" = lock-false;
          # "browser.newtabpage.activity-stream.showSponsored" = lock-false;
          # "browser.newtabpage.activity-stream.system.showSponsored" = lock-false;
          # "browser.newtabpage.activity-stream.showSponsoredTopSites" = lock-false;
        };
      };
  };
  programs.hyprland.enable = true; # enable Hyprland

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    # nix-software-center
    httpie
    television
    nix-search-tv 
    kitty # required for the default Hyprland config
    micro
    zellij
    tailscale
    tealdeer
    fzf
    python3
    uv
    mise
    nerd-fonts.jetbrains-mono
    zsh
    claude-code
    lazygit
    lsd
    bat
    ripgrep
    fd
    eza
    atool
    zstd
  ];

  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Nuthanon Ninyawee";
        email = "ninyawee@hey.com";
      };
    };
  };
  programs.git.lfs.enable = true;

  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  
  
  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
}
