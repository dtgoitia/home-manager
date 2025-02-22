{
  config,
  pkgs,
  ...
}: {
  programs = {
    dust.enable = true;
    toggl-cli.enable = true;
  };
}
