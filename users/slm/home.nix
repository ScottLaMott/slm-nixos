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
      c="clear";
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

      # own new slm-zshrc
      source ${config.xdg.configHome}/zsh/slm-zshrc

      # source powerlevel prompt
      [ -f ${config.xdg.configHome}/powerlevel10k/.p10k.zsh]        && source ${config.xdg.configHome}/powerlevel10k/.p10k.zsh

      [ -f  ${config.xdg.dataHome}/zsh/bin/slm-aliases ]            && source ${config.xdg.dataHome}/zsh/bin/slm-aliases
      [ -f  ${config.xdg.dataHome}/zsh/bin/slm-colored-man-pages ]  && source ${config.xdg.dataHome}/zsh/bin/slm-colored-man-pages
      # [ -f  ${config.xdg.dataHome}/zsh/bin/slm-zsh-vim-mode ]       && source ${config.xdg.dataHome}/zsh/bin/slm-zsh-vim-mode

      # set terminal colorscheme --> papercolor-dark jellybeans dracula black-metal-nile summerfruit-dark
      /usr/bin/theme.sh monokai-soda

      # init function for zvm
      function zvm_config() {
        ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
      }
      zvm_config

      # fzf-history-widget with <CTRL>-r,  in viins and vicmd mode
      zvm_after_init_commands+=('bindkey -M viins '^R' fzf-history-widget')

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
    plugins = with pkgs.vimPlugins; [
      # colorscheme
      dracula-vim gruvbox jellybeans-vim nord-vim vim-monokai

      # airline
      vim-airline vim-airline-themes

      # the best of the rest
      fzf-vim  markdown-preview-nvim  vim-nix
      vim-startify  vim-vinegar  vim-fugitive
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
      password    = "--- insert pw here ---";
      device_name = "nixos";
    };
  };
}
