{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.tree = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Command to produce a depth indented directory listing";
    };
  };

  config = lib.mkIf config.programs.tree.enable {
    home.packages = [
      pkgs.tree
    ];
  };
}
