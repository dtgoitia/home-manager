{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.ledger-cli = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Double-entry accounting system with a command-line reporting interface";
    };
  };

  config = lib.mkIf config.programs.ledger-cli.enable {
    home.packages = [
      pkgs.ledger
    ];
  };
}
