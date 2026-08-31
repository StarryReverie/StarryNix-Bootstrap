{
  description = "StarryNix-Bootstrap";

  inputs = { };

  outputs = { self, ... }: {
    templates = {
      default = self.templates.plain;

      haskell = {
        path = ./templates/haskell;
        description = "Multi-packages Haskell monorepo";
      };

      plain = {
        path = ./templates/plain;
        description = "General and unspecified use cases";
      };
    };
  };
}
