# create symlinks to repository

# -----------------------------------------------------------
# nix system configuration
pushd /etc/nixos
echo $(pwd)
ln -s $HOME/ws/slm-nixos/system/configuration.nix configuration.nix
popd 

# -----------------------------------------------------------
# nix user configuration
pushd $HOME/.config/nixpkgs
ln -s $HOME/ws/slm-nixos/users/slm/home.nix   home.nix
ln -s $HOME/ws/slm-nixos/users/slm/config.nix config.nix
popd 

# -----------------------------------------------------------
# alacritty configuration
mkdir -p $HOME/.config/alacritty
pushd $HOME/.config/alacritty
ln -s $HOME/ws/slm-nixos/users/slm/alacritty/alacritty.yml alacritty.yml
popd 

# awesome configuration
mkdir -p $HOME/.config/awesome
pushd $HOME/.config/awesome
ln -s $HOME/ws/slm-nixos/users/slm/awesome/rc.lua rc.lua
popd 

# ranger configuration
pushd $HOME/.config
ln -s $HOME/ws/slm-nixos/users/slm/ranger ranger
popd 
