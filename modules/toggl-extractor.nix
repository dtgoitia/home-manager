{
  lib,
  config,
  pkgs,
  ...
}: {
  options.services.toggl-extractor = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "systemd service and timer to run toggl-extractor every day (toggl-extractor must be installed separately)";
    };
  };

  config = lib.mkIf config.services.toggl-extractor.enable {
    systemd.user.services = {
      toggl-extractor = {
        Unit = {
          Description = "tool to download all your Toggl data using the Toggl API";
          After = ["check-internet.service"];
          Wanted = ["check-internet.service"];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${pkgs.nix}/bin/nix run .#start";
          WorkingDirectory = "${config.home.homeDirectory}/projects/toggl-extractor";
          EnvironmentFile = "${config.home.homeDirectory}/.secrets/toggl-extractor";
        };
        Install.WantedBy = ["default.target"];
      };
    };

    systemd.user.timers = {
      toggl-extractor-daily = {
        Unit = {
          Description = "run toggl-extractor daily";
        };
        Timer = {
          OnCalendar = "06:00";
          Unit = "toggl-extractor.service";
        };
        Install = {
          WantedBy = ["timers.target"];
        };
      };
    };
  };
}
