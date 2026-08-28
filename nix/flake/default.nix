{ config, inputs, ... }:
{
  imports = [ ];

  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
      };
    };

  flake.inputs = inputs;
}
