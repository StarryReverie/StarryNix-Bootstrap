{ config, inputs, ... }:
{
  perSystem =
    {
      pkgsDev,
      config,
      lib,
      ...
    }:
    {
      devShells.default = pkgsDev.haskellPackages.shellFor {
        packages =
          hpkgs:
          lib.pipe config.legacyPackages.internalPkgs [
            (lib.attrsets.filterAttrs (name: value: lib.isDerivation value))
            lib.attrsets.attrValues
          ];

        nativeBuildInputs = [
          pkgsDev.cabal-install
          pkgsDev.cabal2nix
          pkgsDev.hpack

          config.legacyPackages.haskellPkgs.haskell-language-server
          config.legacyPackages.haskellPkgs.hlint
          config.legacyPackages.haskellPkgs.implicit-hie
          pkgsDev.fourmolu
          pkgsDev.ghcid

          pkgsDev.nixfmt
          pkgsDev.treefmt
        ];

        withHoogle = true;
      };
    };
}
