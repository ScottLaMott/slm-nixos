# create symlinks to repo

# nix system configs
pushd /etc/nixos
echo $(pwd)
ln -s $HOME/ws/slm-nix/system/configuration.nix configuration.nix
popd 

# nix user configs
pushd $HOME/.config/nixpkgs
ln -s $HOME/ws/slm-nix/users/slm/home.nix   home.nix
ln -s $HOME/ws/slm-nix/users/slm/config.nix config.nix
popd 

# nix user configs
mkdir -p $HOME/.config/alacritty
pushd $HOME/.config/alacritty
ln -s $HOME/ws/slm-nix/users/slm/alacritty/alacritty.yml alacritty.yml
popd 
mkdir -p $HOME/.config/awesome
pushd $HOME/.config/awesome
ln -s $HOME/ws/slm-nix/users/slm/awesome/rc.lua rc.lua
popd 
