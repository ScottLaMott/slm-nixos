# kopiert configs in git staging bereich

# user configs
cp -r ~/.config/nixpkgs/home.nix          ~/ws/slm-nixos/users/slm
cp -r ~/.config/nixpkgs/config.nix        ~/ws/slm-nixos/users/slm

cp -r ~/.config/awesome                   ~/ws/slm-nixos/users/slm
cp -r ~/.config/alacritty                 ~/ws/slm-nixos/users/slm
cp -r ~/.config/git                       ~/ws/slm-nixos/users/slm

# nix-shells
cp -r ~/.config/nixpkgs/mutt.nix          ~/ws/slm-nixos/shell
cp -r ~/.config/nixpkgs/neomutt.nix       ~/ws/slm-nixos/shell
cp -r ~/.config/nixpkgs/thunderbird.nix   ~/ws/slm-nixos/shell
cp -r ~/.config/nixpkgs/spotify.nix       ~/ws/slm-nixos/shell
