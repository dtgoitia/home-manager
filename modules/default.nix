{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./generic
    ./build-transient-config
  ];
}
