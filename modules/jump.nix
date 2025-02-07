{
  lib,
  config,
  pkgs,
  ...
}: {
  options.programs.jump = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Jump helps you navigate faster by learning your habits.";
    };
  };

  config = lib.mkIf config.programs.jump.enable {
    home.packages = [
      pkgs.jump
    ];

    programs = lib.mkIf config.programs.fish.enable {
      fish = {
        shellInit = ''
          # initialize jump
          jump shell fish | source
        '';
      };
    };
  };
}
