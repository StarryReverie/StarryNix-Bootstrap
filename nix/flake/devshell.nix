{ config, inputs, ... }:
{
  perSystem =
    { system, pkgs, ... }:
    {
      devShells.default = pkgs.mkShellNoCC {
        packages = [
          pkgs.nixfmt
          pkgs.treefmt
        ];
      };
    };
}
