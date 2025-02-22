{
  config,
  pkgs,
  ...
}: {
  programs = {
    bat.enable = true;
    dust.enable = true;
    jump.enable = true;
    toggl-cli.enable = true;
    tree.enable = true;
    yq.enable = true;
  };
}
