{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username      = "slm";
  home.homeDirectory = "/home/slm";
  home.stateVersion  = "22.05";
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  #--------------------------------------------------------------------------------
  # config by slm
  #
  home.packages = with pkgs; [
    btop cmatrix cheat feh figlet gdu gnupg ipcalc kitty lsd
    minicom neovim powerline-fonts sxiv spotifyd spotify-tui
    w3m xorg.xeyes zathura
  ];

  #--------------------------------------------------------------------------------
  # zsh configuration
  #
  programs.zsh = {

    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting= true;
    defaultKeymap = "viins";
    dotDir = ".config/zsh";

    localVariables = {
      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD="true";
    };

    shellAliases = {
      c  = "clear";
      cp = "cp -i";
      ls = "lsd";
      mv = "mv -i";
      rm = "rm -i";
      v  = "vim";
      # quit ranger to current direcotry
      # not working correct / slm / ranger="ranger --choosedir=$HOME/.rangerdir; cd $(cat $HOME/.rangerdir)";
    };

    history = {
      save = 100000;
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      zplugHome = "${config.xdg.dataHome}/zsh/zplug";
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "jeffreytse/zsh-vi-mode"; } # better vi-mode integration
      ];
    };

  initExtra = ''
      #--------------------------------------------------------------------------------
      # declared in home.nix with programs.zsh.initExtra / slm
      #

      echo
      echo "config.xdg.configHome = ${config.xdg.configHome} ...."
      echo "config.xdg.dataHome   = ${config.xdg.dataHome} ...."
      echo

      # source ${config.xdg.configHome}/zsh/slm-zshrc

      [ -f  ${config.xdg.dataHome}/zsh/shell/slm-aliases ]           && source ${config.xdg.dataHome}/zsh/shell/slm-aliases
      [ -f  ${config.xdg.dataHome}/zsh/shell/slm-colored-man-pages ] && source ${config.xdg.dataHome}/zsh/shell/slm-colored-man-pages

      # source powerlevel prompt
      source ${config.xdg.configHome}/powerlevel10k/.p10k.zsh

      # set terminal colorscheme --> papercolor-dark jellybeans dracula
      # black-metal-nile summerfruit-dark
      /usr/bin/theme.sh monokai-soda

      # init function for zvm
      function zvm_config() {
        ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
      }
      zvm_config
      # fzf-history-widget with <CTRL>-r,  in viins and vicmd mode
      zvm_after_init_commands+=('bindkey -M viins '^R' fzf-history-widget')

      # zsh completion
      zmodload zsh/complist

      # Use vim keys in tab complete menu:
      zstyle ':completion:*' menu select
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      # remap caps to escape
      setxkbmap -option caps:escape

      #--------------------------------------------------------------------------------
    '';
  };

  #--------------------------------------------------------------------------------
  # vim configuration
  #
  programs.vim = {
    enable = true;
    plugins = with pkgs; [
      # colorscheme
      vimPlugins.dracula-vim vimPlugins.gruvbox vimPlugins.jellybeans-vim vimPlugins.nord-vim
      vimPlugins.vim-monokai

      # airline
      vimPlugins.vim-airline vimPlugins.vim-airline-themes

      # the best of the rest
      vimPlugins.fzf-vim
      vimPlugins.markdown-preview-nvim
      vimPlugins.vim-nix
      vimPlugins.vim-startify
      vimPlugins.vim-vinegar
      vimPlugins.vim-fugitive
    ];

    # settings managed by home manager
    settings = {
      number = true;
      relativenumber  = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    extraConfig  = ''
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " declared in home.nix / by slm
      "

      " source slm settings
      source ${config.xdg.configHome}/vim/settings.vim
      " source slm mappings
      source ${config.xdg.configHome}/vim/maps.vim

      " set colors --> gruvbox nord jellybeans
      colorscheme monokai
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    '';
  };

  #--------------------------------------------------------------------------------
  # fzf configuration
  #
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--layout=reverse"
      "--info=inline"
      ];
  };

  #--------------------------------------------------------------------------------
  # xdg configuration
  #
  xdg = {
    enable = true;
  };

  #--------------------------------------------------------------------------------
  # spotifyd service
  #
  services.spotifyd.enable = true;
  services.spotifyd.settings = {
    global = {
      username    = "ScottLaMott";
      password    = "lnukm-uasa";
      device_name = "nixos";
    };
  };
}
