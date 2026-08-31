{ config, inputs, ... }:
{
  imports = [
    ./devshell.nix
  ];

  perSystem =
    { system, pkgs, ... }:
    {
      _module.args.pkgsDev = pkgs;
    };

  flake.inputsDev = inputs;
}
