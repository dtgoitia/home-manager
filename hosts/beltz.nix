{
  config,
  pkgs,
  ...
}: {
  programs = {
    bat.enable = true;
    dust.enable = true;
    toggl-cli.enable = true;
    yq.enable = true;
  };
}
