{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "aki";
  home.homeDirectory = "/home/aki";

  # Packages that should be installed to the user profile.
  home.packages = [
    pkgs.appimage-run
    pkgs.epson-escpr
    pkgs.wpsoffice
    pkgs.obsidian
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
    btop.enable = true;
    kitty.enable = true;

    git = {
      enable = true;
      userEmail = "80670461+akippnn@users.noreply.github.com";
      userName = "akippnn";
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      coc.enable = true;

      extraConfig = ''
        set wrap
        set number
      '';
    };
  };
}
