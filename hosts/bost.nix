{
  config,
  pkgs,
  ...
}: {
  programs = {
    bat.enable = true;
    dust.enable = true;
    fish.enable = true;
    git.enable = true;
    jump.enable = true;
    starship.enable = true;
    yazi.enable = true;
  };

  services = {
    rpi-temperature-tracker.enable = true;
    toggl-extractor.enable = true;
  };
}
