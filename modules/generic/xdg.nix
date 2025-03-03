{
  lib,
  config,
  pkgs,
  ...
}: let
  at_least_one_gui_app_is_enabled = builtins.hasAttr "gui-apps" config.custom && config.custom.gui-apps != {};
in {
  config = lib.mkIf at_least_one_gui_app_is_enabled {
    home.activation = {
      update-desktop-database = lib.hm.dag.entryAfter ["writeBoundary"] ''
        ${pkgs.desktop-file-utils}/bin/update-desktop-database ~/.local/share/applications/
      '';
    };
  };
}
