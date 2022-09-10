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
    echo "set neomutt in prompt please ..."
    #
    export EDITOR=vim
    # 
  '';
}
