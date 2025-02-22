{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.gimp = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Console system performance monitor";
    };
  };

  config = lib.mkIf config.programs.gimp.enable {
    home.packages = [
      pkgs.gimp
    ];
  };
}
