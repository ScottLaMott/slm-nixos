# neomutt.nix

with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    neomutt
  ];

  shellHook = ''
    echo ""
    echo ".... shellHook ......................................."
    echo ""
    echo "hello neomutt shell ..."

    # set zsh-nix-shell in prompt
    export HOST=neomutt-nix-shell
    
    #
    export EDITOR=vim
    echo "run neomutt ..."
    # exec -a neomutt neomutt
    # 
  '';
}
