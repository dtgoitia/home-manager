{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.meld = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Visual diff and merge tool";
    };
  };

  config = lib.mkIf config.programs.meld.enable {
    home.packages = [
      pkgs.meld
    ];
  };
}
