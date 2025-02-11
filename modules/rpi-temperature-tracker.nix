{
  lib,
  config,
  pkgs,
  rpi-temperature-tracker, # remember to add it to `extraSpecialArgs` in `flake.nix`
  ...
}: {
  options.services.rpi-temperature-tracker = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "systemd service to run rpi-temperature-tracker on boot";
    };
  };

  config = lib.mkIf config.services.rpi-temperature-tracker.enable {
    systemd.user.services = {
      rpi-temperature-tracker = {
        Unit = {
          Description = "RPi5 temperature tracker";
          After = ["network.target"];
        };
        Service = {
          Type = "simple";
          ExecStart = "${rpi-temperature-tracker.packages.${pkgs.system}.default}/bin/rpi-temperature-tracker";
          Restart = "always";
        };
        Install = {
          WantedBy = ["default.target"];
        };
      };
    };
  };
}
