#---------------------------------------------------
# slm@schoco-company.com
#
# create symlinks to repository
#
#---------------------------------------------------

# nix system configuration
pushd /etc/nixos
echo $(pwd)
ln -s $HOME/ws/slm-nixos/system/configuration.nix configuration.nix
popd

# --- nix user configuration
pushd $HOME/.config/nixpkgs
ln -s $HOME/ws/slm-nixos/users/guest/home.nix   home.nix
ln -s $HOME/ws/slm-nixos/users/guest/config.nix config.nix
popd

# --- alacritty configuration
mkdir -p $HOME/.config/alacritty
pushd $HOME/.config/alacritty
ln -s $HOME/ws/slm-nixos/users/guest/alacritty/alacritty.yml alacritty.yml
popd

# --- awesome configuration
mkdir -p $HOME/.config/awesome
pushd $HOME/.config/awesome
ln -s $HOME/ws/slm-nixos/users/guest/awesome/rc.lua rc.lua
popd

# --- git configuration
mkdir -p $HOME/.config/git
pushd $HOME/.config/git
ln -s $HOME/ws/slm-nixos/users/guest/git/config config
popd

# --- ranger configuration
pushd $HOME/.config
ln -s $HOME/ws/slm-nixos/users/guest/ranger ranger
popd

# --- vim configuration
pushd $HOME/.config/vim
ln -s $HOME/ws/slm-nixos/configs/vim/settings.vim settings.vim
ln -s $HOME/ws/slm-nixos/configs/vim/maps.vim maps.vim
popd

# --- zsh configuration
pushd $HOME/.config/zsh
ln -s $HOME/ws/slm-nixos/configs/zsh/slm-zshrc slm-zshrc
popd
