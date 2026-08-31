{ config, inputs, ... }:
{
  perSystem =
    { system, pkgsDev, ... }:
    {
      devShells.default = pkgsDev.mkShellNoCC {
        packages = [
          pkgsDev.nixfmt
          pkgsDev.treefmt
        ];
      };
    };
}
