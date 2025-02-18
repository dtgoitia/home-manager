{
  lib,
  config,
  pkgs,
  check-internet, # remember to add it to `extraSpecialArgs` in `flake.nix`
  ...
}: {
  config = {
    systemd.user.services = {
      check-internet = {
        Unit = {
          Description = "wait until internet access is available";
          After = ["network-online.target"];
          Wants = ["network-online.target"];
        };
        Service = {
          Type = "oneshot";
          ExecStart = "${check-internet.packages.${pkgs.system}.default}/bin/check-internet";
        };
        Install = {
          WantedBy = ["default.target"];
        };
      };
    };
  };
}
