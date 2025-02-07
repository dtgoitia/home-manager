# My [`home-manager`][1] files

## Installation

1. Install `nix`.

2. Put the configuration files in the right location:

    ```shell
    cd /best/dir/ever
    git clone git@github.com:dtgoitia/home-manager.git

    ln -s /best/dir/ever/home-manager ~/.config/home-manager
    ```

3. Install `home-manager` and apply configuration:

    ```
    nix run home-manager/master -- switch
    ```

    Note that - because `home-manager` is not installed yet - we are using a remote flake to apply our configuration. To get `home-manager` available locally, make sure your configuration installs it:
    
    ```nix
    # ...
      programs.home-manager.enable = true;
    }
    ```

## Usage

```shell
home-manager switch
```

<!-- External references -->

[1]: https://nix-community.github.io/home-manager/ "home-manager - official docs"