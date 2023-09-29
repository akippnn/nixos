{ pkgs, ... }:

let
  my-python-packages = ps: with ps; [
    future
    # other python packages
  ];
in {
    environment.systemPackages = [
        (pkgs.python3.withPackages my-python-packages)
    ];
}
