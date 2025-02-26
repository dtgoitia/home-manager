{
  lib,
  config,
  pkgs,
  toggl-cli, # remember to add it to `extraSpecialArgs` in `flake.nix`
  ...
}: {
  options.programs.toggl-cli = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Toggl CLI";
    };
  };

  config = lib.mkIf config.programs.toggl-cli.enable {
    home.packages = [
      toggl-cli.packages.${pkgs.system}.default
    ];

    programs.fish = lib.mkIf config.programs.fish.enable {
      shellAbbrs = {
        tt = "t status";
      };
    };
  };
}
