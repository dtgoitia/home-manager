{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.keepassxc = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Offline password manager with many features";
    };
  };

  config = lib.mkIf config.programs.keepassxc.enable {
    home.packages = [
      pkgs.keepassxc
    ];
  };
}
