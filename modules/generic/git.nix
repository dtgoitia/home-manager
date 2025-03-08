{
  lib,
  config,
  ...
}: {
  config = lib.mkIf config.programs.git.enable {
    programs = {
      git = {
        userName = "David Torralba Goitia";
        userEmail = "david.torralba.goitia@gmail.com";

        aliases = {
          br = "branch";
          ch = "checkout";
          co = "commit";
          st = "status";
          ps = "push";
          pl = "pull";
          lg = "log --oneline --graph --decorate --all";
          unstage = "reset HEAD --";
          dtgoitia = "!f() { reponame=$1; git clone git@github.com:dtgoitia/\${reponame}.git; }; f";
        };

        extraConfig = {
          branch.sort = "-committerdate";

          "color \"status\"" = {
            added = "yellow";
            changed = "red";
            untracked = "red";
          };

          commit.verbose = true;

          core = {
            editor = "vim";
            excludesfile = "~/.config/git/ignore";
            ignorecase = false;
          };

          diff = {
            algorithm = "histogram";
            colorMoved = "plain";
            mnemonicPrefix = true;
            renames = true;
            tool = lib.mkIf config.programs.meld.enable "meld";
          };

          fetch = {
            prune = true;
            pruneTags = true;
            all = true;
          };

          help.autocorrect = "prompt";

          init.defaultBranch = "main";

          merge.conflictstyle = "zdiff3";

          pull.ff = "only"; # fast-forward only

          push = {
            default = "current";
            autoSetupRemote = true;
            followTags = true; # automatically push local tags on next push
          };

          submodule.recurse = true;

          tag.sort = "version:refname"; # list tags in lexicographic order
        };
      };

      fish = lib.mkIf config.programs.fish.enable {
        shellAbbrs = {
          g = "git";
          gs = "git status -s";
          ga = "git add";
          gc = "git commit";
          gpl = "git pull";
          gps = "git push";
          gch = "git checkout";
          gb = "git branch";
          gd = "git branch -D";
          gm = "git branch -m";
          gl = "git log --oneline --graph --decorate --branches";
          gr = "git reset HEAD~";
          gw = ''git commit -am "WIP_UNDO_ME"'';
          grc = "git rebase --continue";
          gra = "git rebase --abort";
          gf = "git fetch --all --prune";
        };
      };
    };

    home.file.".config/git/ignore".text = ''
      # Git
      .git/

      # Python
      .venv*/
      .env/
      .pytest_cache/
      __pycache__/
      *.py[cod]
      *.pyc
      .tox/
      *.egg-info/
      .mypy_cache/
      .ruff_cache/
      .hypothesis/

      # Direnv
      .env
      .envrc

      # Node.js
      node_modules/

      # Visual Studio Code
      .vscode/

      # Pycharm
      .idea/

      # Mac
      .DS_Store
      .DS_Store?
      *.swp

      # Windows
      Thumbs.db

      # SQLite databases
      *.db
      *.sqlite

      # Rust
      target/

      # Nix
      result/

      # Dart
      .dart_tool/
    '';
  };
}
