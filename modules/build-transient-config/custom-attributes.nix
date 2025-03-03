{
  lib,
  config,
  pkgs,
  ...
}: {
  options.custom = lib.mkOption {
    type = lib.types.attrsOf (lib.types.attrsOf lib.types.bool); # if use `lib.types.attrs`, the nested values are not merged
    default = {};
    description = "Custom attributes for user configuration";
  };
}
