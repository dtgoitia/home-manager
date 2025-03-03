{
  config,
  pkgs,
  ...
}: {
  home.username = "dtg";
  home.homeDirectory = "/home/dtg";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    ../modules
  ];
}
