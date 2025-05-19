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
    programs.ssh = {
      enable = true;
      extraConfig = ''
        Host *
            IdentityAgent ~/.1password/agent.sock
      '';
    };

      # This value determines the Home Manager release that your configuration is 
  # compatible with. This helps avoid breakage when a new Home Manager release 
  # introduces backwards incompatible changes. 
  #
  # You should not change this value, even if you update Home Manager. If you do 
  # want to update the value, then make sure to first check the Home Manager 
  # release notes. 
  home.stateVersion = "24.11"; # Please read the comment before changing. 
  };

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
