{
  lib,
  config,
  pkgs,
  ...
}: let
  # fix `.desktop` file: use absolute paths
  desktop_file_in_derivation = builtins.readFile "${pkgs.keepassxc}/share/applications/org.keepassxc.KeePassXC.desktop";
  patch__Exec = "Exec=${pkgs.keepassxc}/bin/keepassxc %f";
  patch__TryExec = "TryExec=${pkgs.keepassxc}/bin/keepassxc";
  patch__Icon = "Icon=${pkgs.keepassxc}/share/icons/hicolor/scalable/apps/keepassxc.svg";
  patched_desktop_file =
    builtins.replaceStrings
    ["Exec=keepassxc %f" "TryExec=keepassxc" "Icon=keepassxc"]
    [patch__Exec patch__TryExec patch__Icon]
    desktop_file_in_derivation;
in {
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

    home.file.".local/share/applications/org.keepassxc.KeePassXC.desktop".text = patched_desktop_file;

    custom.gui-apps.keepassxc = true;
  };
}
