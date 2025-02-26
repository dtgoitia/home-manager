{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.yq = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "a portable command-line YAML, JSON, XML, CSV, TOML and properties processor";
    };
  };

  config = lib.mkIf config.programs.yq.enable {
    home.packages = [
      pkgs.yq
    ];
  };
}
