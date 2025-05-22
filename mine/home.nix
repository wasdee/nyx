{ config, pkgs, ... }:
# let
#     home-manager = builtins.fetchTarball {
#         url = "https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz";
#         sha256 = "1cp2rpprcfl4mjsrsrpfg6278nf05a0mpl3m0snksvdalfmc5si5";
#     };
# in
{
    imports = [
        # (import "${home-manager}/nixos")
        <home-manager/nixos>
    ];

  home-manager.users.ben = { 
  home.stateVersion = "25.05"; # Please read the comment before changing. 

      home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/fuchsia-cursor/releases/download/v2.0.0/Fuchsia-Pop.tar.gz"
        "sha256-BvVE9qupMjw7JRqFUj1J0a4ys6kc9fOLBPx2bGaapTk="
        "Fuchsia-Pop";
  };
  #   programs.ssh = {
  #     enable = true;
  #     extraConfig = ''
  #       Host *
  #           IdentityAgent ~/.1password/agent.sock
  #     '';
  #   };

    # GNOME desktop settings
    # dconf.settings = {
    #   "org/gnome/desktop/interface" = {
    #     gtk-theme = "Adwaita-dark";
    #     color-scheme = "prefer-dark";
    #   };
      
    #   # Set taskbar favorites
    #   "org/gnome/shell" = {
    #     favorite-apps = [
    #       "firefox.desktop"
    #       "org.gnome.Nautilus.desktop"
    #       "code.desktop"
    #       "org.gnome.Terminal.desktop"
    #     ];
    #   };
    # };

    # Set default applications
    # xdg.mimeApps = {
    #   enable = true;
    #   defaultApplications = {
    #     "text/html" = "firefox.desktop";
    #     "x-scheme-handler/http" = "firefox.desktop";
    #     "x-scheme-handler/https" = "firefox.desktop";
    #     "x-scheme-handler/about" = "firefox.desktop";
    #     "x-scheme-handler/unknown" = "firefox.desktop";
    #   };
    # };

      # This value determines the Home Manager release that your configuration is 
  # compatible with. This helps avoid breakage when a new Home Manager release 
  # introduces backwards incompatible changes. 
  #
  # You should not change this value, even if you update Home Manager. If you do 
  # want to update the value, then make sure to first check the Home Manager 
  # release notes. 
  # };

    # home.file = {
    # # ".bashrc".source            = ./sources/bashrc.sh";
    # # ".emacs.d/init.el".source   = ./sources/init.el;
    # # ".config/git/config".source = ./sources/gitconfig.txt;
    # # ".Xresources".source        = ./sources/xresources.txt;
    # # ".local/bin" = {
    # #     source = ./sources/scripts;
    # #     recursive = true;
    # # };

    # };

}
