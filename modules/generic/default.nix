{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./alejandra.nix
    ./atop.nix
    ./check-internet.nix
    ./dust.nix
    ./fish.nix
    ./gimp.nix
    ./git.nix
    ./jump.nix
    ./keepassxc.nix
    ./ledger-cli.nix
    ./meld.nix
    ./rpi-temperature-tracker.nix
    ./starship.nix
    ./toggl-cli.nix
    ./toggl-extractor.nix
    ./tree.nix
    ./xdg.nix
    ./yq.nix
  ];
}
