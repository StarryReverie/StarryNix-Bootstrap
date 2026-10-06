{
  description = "StarryNix-Bootstrap";

  inputs = { };

  outputs = { self, ... }: {
    templates = {
      default = self.templates.plain;

      haskell = {
        path = ./templates/haskell;
        description = "Multi-packages Haskell monorepo";
        welcomeText = builtins.readFile ./templates/haskell/README.md;
      };

      plain = {
        path = ./templates/plain;
        description = "General and unspecified use cases";
        welcomeText = builtins.readFile ./templates/plain/README.md;
      };
    };
  };
}
