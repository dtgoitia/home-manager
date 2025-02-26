{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.atop = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Console system performance monitor";
    };
  };

  config = lib.mkIf config.programs.atop.enable {
    home.packages = [
      pkgs.atop
    ];
  };
}
