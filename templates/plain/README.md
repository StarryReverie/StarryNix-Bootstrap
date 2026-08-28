# Plain Template

## Overview

A template for general and unspecified use cases.

This flake contains a flake partition `nix/flake/dev`, where all development-only flake inputs and outputs, such as `devShells`, should be placed. See also <https://flake.parts/options/flake-parts-partitions.html>.

## Deployment

### Initialize the Flake

Inside an empty directory, run the following command:

```sh
nix flake init -t github:StarryReverie/StarryNix-Bootstrap#plain
```

The lockfile in the template repository may be outdated, you can run the following command to update flake inputs:

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
