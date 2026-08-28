{ config, inputs, ... }:
{
  imports = [
    ./devshell.nix
  ];

  perSystem =
    { system, ... }:
    {
      _module.args.pkgsDev = import inputs.nixpkgs {
        inherit system;
      };
    };

  flake.inputsDev = inputs;
}
