{
  config,
  pkgs,
  ...
}: {
  programs = {
    toggl-cli.enable = true;
  };
}
