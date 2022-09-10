# mutt.nix

with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    mutt
  ];

  shellHook = ''
    echo ""
    echo ".... shellHook ......................................."
    echo ""
    echo "hello mutt shell ..."
    echo "set mutt in prompt please ..."
    #
    export EDITOR=vim
    #
  '';
}
