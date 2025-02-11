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

  programs = {
    dust.enable = true;
    fish.enable = true;
    git.enable = true;
    jump.enable = true;
    starship.enable = true;
    yazi.enable = true;
  };

  services.toggl-extractor.enable = true;

  imports = [
    ./modules/dust.nix
    ./modules/fish.nix
    ./modules/git.nix
    ./modules/jump.nix
    ./modules/starship.nix
    ./modules/toggl-extractor.nix
  ];
}
