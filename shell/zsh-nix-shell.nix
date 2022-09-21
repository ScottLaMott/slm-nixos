# zsh-nix-shell.nix

with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    git-crypt
    lsd
    progress # fortschrittsanzeige bei dd, cp, mv ...
    stow
  ];

  shellHook = ''
    echo ""
    echo ".... shellHook ......................................."
    echo ""
    echo "hello zsh-nix-shell shell ..."

    # set zsh-nix-shell in prompt
    export HOST=zsh-nix-shell
    export name=zsh-nix-shell

    # set $HOME
    export HOME=$HOME/ws/zsh-nix-shell
    [ -d $HOME ] ||  mkdir $HOME

    # set config of xdg
    export XDG_CONFIG_HOME=$HOME/.config
    [ -d $XDG_CONFIG_HOME ] ||  mkdir $XDG_CONFIG_HOME

    # set data of xdg
    export XDG_DATA_HOME=$HOME/.local/share
    [ -d $XDG_DATA_HOME ] ||  mkdir $XDG_DATA_HOME

    # set data of xdg
    export XDG_DATA_HOME=$HOME/.local/share
    [ -d $XDG_DATA_HOME ] ||  mkdir --parents $XDG_DATA_HOME

    # set cache of xdg
    export XDG_CACHE_HOME=$HOME/.cache
    [ -d $XDG_CACHE_HOME/zsh ] ||  mkdir --parents $XDG_CACHE_HOME/zsh

    # invoke zsh
    exec zsh
    #
  '';
}
