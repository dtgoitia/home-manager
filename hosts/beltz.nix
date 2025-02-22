{
  config,
  pkgs,
  ...
}: {
  programs = {
    atop.enable = true;
    bat.enable = true;
    dust.enable = true;
    jump.enable = true;
    ledger-cli.enable = true;
    toggl-cli.enable = true;
    tree.enable = true;
    yazi.enable = true;
    yq.enable = true;
  };
}
