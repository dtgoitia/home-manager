{
  lib,
  config,
  pkgs,
  ...
}: let
  # fix `.desktop` file: use absolute paths
  desktop_file_in_derivation = builtins.readFile "${pkgs.vlc}/share/applications/vlc.desktop";
  patch__Icon = "Icon=${pkgs.vlc}/share/icons/hicolor/256x256/apps/vlc.png";
  patched_desktop_file =
    builtins.replaceStrings
    ["Icon=vlc"]
    [patch__Icon]
    desktop_file_in_derivation;
in {
  options.programs.vlc = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      example = true;
      description = "Cross-platform media player and streaming server";
    };
  };

  config = lib.mkIf config.programs.vlc.enable {
    home.packages = [
      pkgs.vlc
    ];

    home.file.".local/share/applications/vlc.desktop".text = patched_desktop_file;

    custom.gui-apps.vlc = true;
  };
}
