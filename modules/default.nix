{
    config,
    pkgs,
    pkgs-unstable,
    ...
}:

{
    imports = [
        ./system.nix
        ./emacs.nix
        ./python.nix
        ./steam.nix
    ];
}
