{ config, inputs, ... }:
{
  flake.templates = {
    default = config.flake.templates.plain;

    plain = {
      path = ../../templates/plain;
      description = "General and unspecified use cases";
    };
  };
}
