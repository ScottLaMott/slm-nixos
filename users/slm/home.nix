#---------------------------------------------------
# slm@schoco-company.com
#
# home.nix / User Configuration
#
#---------------------------------------------------

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
    btop
    cmatrix
    cheat
    feh
    figlet
    gdu
    gnupg
    ipcalc
    kitty
    lf
    lsd
    minicom
    neovim
    neomutt
    powerline-fonts
    rofi
    sxiv
    spotifyd
    spotify-tui
    w3m
    xorg.xeyes
    zathura
  ];

  #-----------------------------------------------------------------------------
  # zsh configuration
  #
  programs.zsh = {

    enable = true;
    defaultKeymap = "viins";
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    dotDir = ".config/zsh";
    shellAliases = { };              # aliase, ausgelagert, see slm-aliases
    history = {
      save = 100000;
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    zplug = {
      enable = true;
      zplugHome = "${config.xdg.dataHome}/zsh/zplug";
      plugins = [
        # { name = "jeffreytse/zsh-vi-mode"; } # better vi-mode integration / macht prompt kaputt /slm / IMPORTANT
        # { name = "hlissner/zsh-autopair"; tags = [ defer:2 ]; }
        # { name = "zsh-users/zsh-autosuggestions"; tags = [ defer:2 ]; ?? on:"zsh-users/zsh-completions" ?? }
      ];
    };
    initExtra = ''
      #------------------------------------------------------------------------
      # declared in home.nix with programs.zsh.initExtra / slm
      #

      # own new slm-zshrc
      [ -f  ${config.xdg.configHome}/zsh/slm-zshrc ]                && source ${config.xdg.configHome}/zsh/slm-zshrc
      [ -f  ${config.xdg.dataHome}/zsh/bin/slm-aliases ]            && source ${config.xdg.dataHome}/zsh/bin/slm-aliases
      [ -f  ${config.xdg.dataHome}/zsh/bin/slm-colored-man-pages ]  && source ${config.xdg.dataHome}/zsh/bin/slm-colored-man-pages
      # [ -f  ${config.xdg.dataHome}/zsh/bin/slm-zsh-vim-mode ]       && source ${config.xdg.dataHome}/zsh/bin/slm-zsh-vim-mode

      # set terminal colorscheme --> papercolor-dark jellybeans dracula black-metal-nile summerfruit-dark
      /usr/bin/theme.sh monokai-soda

      # remap caps to escape
      setxkbmap -option caps:escape

      #------------------------------------------------------------------------
    '';
  }; # end programs.zsh -

  #----------------------------------------------------------------------------
  # vim configuration
  #
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      # -- colorscheme
      awesome-vim-colorschemes
      dracula-vim
      gruvbox
      jellybeans-vim
      nord-vim
      vim-monokai
      # -- airline
      vim-airline
      vim-airline-themes
      # -- the best of the rest
      fzf-vim
      goyo
      markdown-preview-nvim
      limelight-vim
      vim-nix
      vim-startify
      vim-snippets
      vim-vinegar
      vim-fugitive
      ultisnips
    ];
    # -- settings managed by home manager
    settings = {
      number = true;
      relativenumber  = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    extraConfig  = ''
      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      " declared in home.nix / by slm
      "

      " source slm settings
      source ${config.xdg.configHome}/vim/settings.vim
      " source slm mappings
      source ${config.xdg.configHome}/vim/maps.vim

      """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    '';
  };

  #----------------------------------------------------------------------------
  # nvim configuration
  #
  programs.neovim = {
    # enable = true; FIXME
  };

  #----------------------------------------------------------------------------
  # rofi configuration
  #

  programs.rofi = {
    enable = true;
    theme = "gruvbox-dark";
    #theme = "purple";
    terminal = "alacritty";
    location = "center";
    xoffset = -320;
    yoffset = -180;
  };

  #----------------------------------------------------------------------------
  # fzf configuration
  #
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultCommand = "fd --type f --hidden";
    defaultOptions = [
      "--header-first"
      "--layout=reverse"
      "--height=80%"
      "--cycle"
      "--border=sharp"
      "--info=inline"
      "--prompt='fzf-> '"
      "--scroll-off=5"
#      "--preview=bat"
      ];
    changeDirWidgetCommand = "fd --type d --hidden";
  };

  #----------------------------------------------------------------------------
  # xdg configuration
  #
  xdg = {
    enable = true;
  };

  #----------------------------------------------------------------------------
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
