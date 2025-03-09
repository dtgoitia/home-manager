{
  lib,
  config,
  pkgs,
  toggl-extractor, # remember to add it to `extraSpecialArgs` in `flake.nix`
  ...
}: {
  options.services.toggl-extractor = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "systemd service and timer to run toggl-extractor every day (toggl-extractor must be installed separately)";
    };

    data_dir = lib.mkOption {
      type = lib.types.str;
      default = "~/.local/share/toggl-extractor";
      example = "/your/preferred/path";
      description = "directory where the downloaded data will be stored";
    };
  };

  config = lib.mkIf config.services.toggl-extractor.enable {
    home.file.".config/toggl-extractor/config.json".text = ''
      {
        "data_dir": "${config.services.toggl-extractor.data_dir}"
      }
    '';

    systemd.user.services = {
      toggl-extractor = {
        Unit = {
          Description = "tool to download all your Toggl data using the Toggl API";
          After = ["check-internet.service"];
          Wanted = ["check-internet.service"];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${toggl-extractor.packages.${pkgs.system}.default}/bin/toggl-extractor";
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
