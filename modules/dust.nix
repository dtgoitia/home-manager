{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.dust = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "A more intuitive version of du in rust";
    };
  };

  config = lib.mkIf config.programs.dust.enable {
    home.packages = [
      pkgs.dust
    ];
  };
}
