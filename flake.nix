{
  description = "StarryNix-Bootstrap";

  inputs = { };

  outputs = { self, ... }: {
    templates = {
      default = self.templates.plain;

      plain = {
        path = ./templates/plain;
        description = "General and unspecified use cases";
      };
    };
  };
}
