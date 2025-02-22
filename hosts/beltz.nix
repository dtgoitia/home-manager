{
  config,
  pkgs,
  ...
}: {
  programs = {
    alejandra.enable = true;
    atop.enable = true;
    bat.enable = true;
    dust.enable = true;
    fzf.enable = true;
    jq.enable = true;
    jump.enable = true;
    k9s.enable = true;
    keepassxc.enable = true;
    ledger-cli.enable = true;
    meld.enable = true;
    toggl-cli.enable = true;
    tree.enable = true;
    yazi.enable = true;
    yq.enable = true;
  };
}
