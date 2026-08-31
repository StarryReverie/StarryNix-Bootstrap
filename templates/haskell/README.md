# Haskell Template

## Overview

A template for multi-package monorepo Haskell project.

This flake is derived from the [plain](../plain) template, please refer to it first.

In this template, Nix and Nixpkgs provide the GHC toolchain and prebuilt dependency artifacts, while cabal-install only serves as a build tool. However, the Nix support is not invasive, so it should be compatible with normal cabal-install setup. You can build the project with either `cabal build` or `nix build`.

All Haskell packages are in the `hs-packages` directory. Each package use `hpack` and `package.yaml` to generate the actual Cabal file. As long as each package has its `package.yaml` correctly configured, it can be automatically discovered and packaged using Import From Derivation (IFD) in this template. Thus you don't need to manually write a `package.nix` or run `cabal2nix`, although you certainly can add a `package.nix` to a package's root directory to bypass IFD, as the setup also handles this.

You can consume this project via flake outputs `packages` and `legacyPackages`. `packages` only exposes the derivation for production build `packages.*.example-app` typically consumed by end user, while `legacyPackages` exposes both production build, development build attrset `internalPkgs`, and the selected toolchain attrset `haskellPkgs`. Note that development build contains additional build artifacts and references to GHC's store paths.

If you don't want to use flake, you can directly import [`package-set.nix`](./nix/package-set.nix) to get the same attrsets.

## Deployment

### Initialize the Flake

Inside an empty directory, run the following command:

```sh
nix flake init -t github:StarryReverie/StarryNix-Bootstrap#haskell
```

The lockfile in the template repository may be outdated, you can run the following commands to update flake inputs:

```sh
nix flake update
nix flake update --flake ./nix/flake/dev --inputs-from .
```

### Initialize Git Repository

Run the following commands:

```sh
git init
git add .
```

### Replace All Placeholders

You may need to replace the following placeholder:

- `<PROJECT>`: The name of the project.
- `example-lib`: An example Haskell package consists of a library and a test suite.
- `example-app`: An example Haskell package consists of an executable, which depends on `example-lib`.
