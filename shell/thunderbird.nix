# thunderbird.nix

with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    thunderbird
  ];

  shellHook = ''
    echo ""
    echo ".... shellHook ......................................."
    echo "hello thunderbird shell ..."
    #
    export EDITOR=vim
    #
    echo "run thunderbird ..."
    exec -a thunderbird thunderbird
  '';
}
