{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.alejandra = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Uncompromising Nix Code Formatter";
    };
  };

  config = lib.mkIf config.programs.alejandra.enable {
    home.packages = [
      pkgs.alejandra
    ];
  };
}
