{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/nix-community/nix-doom-emacs/archive/master.tar.gz;
    sha256 = "183gr18bqj75cvx46j1axmsxr0kmd3b6y3rs4f207ci1n24qrfqh";
  }) {
    doomPrivateDir = ./doom.d;  # Directory containing your config.el, init.el
                                # and packages.el files
  };
in {
  services.emacs = {
    enable = true;
    package = doom-emacs;
  };
}
