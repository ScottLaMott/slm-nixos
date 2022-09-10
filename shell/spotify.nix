# spotify.nix

with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    spotify
  ];

  shellHook = ''
    echo ""
    echo ".... shellHook ......................................."
    echo ""
    echo "hello spotify shell ..."
    echo "set spotify in prompt please ..."
    #
    export EDITOR=vim
    #
    echo "exec spotify ..."
    exec -a spotify spotify
  '';
}
