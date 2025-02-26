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
    ../modules/generic/alejandra.nix
    ../modules/generic/atop.nix
    ../modules/generic/check-internet.nix
    ../modules/generic/dust.nix
    ../modules/generic/fish.nix
    ../modules/generic/gimp.nix
    ../modules/generic/git.nix
    ../modules/generic/jump.nix
    ../modules/generic/keepassxc.nix
    ../modules/generic/ledger-cli.nix
    ../modules/generic/meld.nix
    ../modules/generic/rpi-temperature-tracker.nix
    ../modules/generic/starship.nix
    ../modules/generic/toggl-cli.nix
    ../modules/generic/toggl-extractor.nix
    ../modules/generic/tree.nix
    ../modules/generic/yq.nix
  ];
}
