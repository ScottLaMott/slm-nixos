# kopiert configs in git staging bereich

# user configs
cp -r ~/.config/nixpkgs/home.nix          ~/ws/slm-nixos/users/slm
cp -r ~/.config/nixpkgs/config.nix        ~/ws/slm-nixos/users/slm

cp ~/.config/awesome/rc.lua               ~/ws/slm-nixos/users/slm/awesome/rc.lua
cp ~/.config/alacritty/alacritty.yml      ~/ws/slm-nixos/users/slm/alacritty/alacritty.yml

# nix-shells
cp -r ~/.config/nixpkgs/mutt.nix          ~/ws/slm-nixos/shell
cp -r ~/.config/nixpkgs/neomutt.nix       ~/ws/slm-nixos/shell
cp -r ~/.config/nixpkgs/thunderbird.nix   ~/ws/slm-nixos/shell
cp -r ~/.config/nixpkgs/spotify.nix       ~/ws/slm-nixos/shell
