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
    feh
    figlet
    gdu
    gnupg
    kitty
    lsd
    powerline-fonts
    xorg.xeyes
  ];

  #--------------------------------------------------------------------------------
  # zsh configuration
  #
  programs.zsh = {
    enable = true;

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
    };

    history = {
      size = 100000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      plugins = [
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "jeffreytse/zsh-vi-mode"; } # better vi-mode integration
      ];
    };

  initExtra = ''
      #
      # declared in home.nix with programs.zsh.initExtra / slm
      #
      echo "config.xdg.configHome = ${config.xdg.configHome} ...."
      echo "config.xdg.dataHome   = ${config.xdg.dataHome} ...."

      source ${config.xdg.configHome}/zsh/slm-zshrc

      [ -f  ${config.xdg.dataHome}/zsh/shell/slm-aliases ]           && source ${config.xdg.dataHome}/zsh/shell/slm-aliases
      [ -f  ${config.xdg.dataHome}/zsh/shell/slm-colored-man-pages ] && source ${config.xdg.dataHome}/zsh/shell/slm-colored-man-pages

      source ${config.xdg.configHome}/powerlevel10k/.p10k.zsh

      # nice terminal colorscheme / papercolor-dark jellybeans dracula
      /usr/bin/theme.sh dracula

      # fzf with <ctrl>-r in viins and vicmd mode
      zvm_bindkey viins '^R' fzf-history-widget
      zvm_bindkey vicmd '^R' fzf-history-widget
      bindkey -M vicmd '^R' fzf-history-widget
      bindkey -M viins '^R' fzf-history-widget

      # Use vim keys in tab complete menu:
      zstyle ':completion:*' menu select
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      # remap caps to escape
      setxkbmap -option caps:escape
    '';
  };

  #--------------------------------------------------------------------------------
  # vim configuration
  #
  programs.vim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.dracula-vim
      pkgs.vimPlugins.gruvbox
      pkgs.vimPlugins.jellybeans-vim
      pkgs.vimPlugins.markdown-preview-nvim
      pkgs.vimPlugins.nord-vim
      pkgs.vimPlugins.vim-airline
      pkgs.vimPlugins.vim-airline-themes
      pkgs.vimPlugins.vim-nix
      pkgs.vimPlugins.vim-vinegar
      pkgs.vimPlugins.vim-fugitive
    ];
    settings = {
      number = true;
      relativenumber  = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };
    extraConfig  = ''
      "
      " declared in home.nix / by slm
      "
      " settings
      set background=dark
      set scrolloff=10
      set cursorline
      set noswapfile

      " netrw settings
      let netrw_banner="1"
      let netrw_liststyle="2"
      let netrw_sizestyle="H"

      " vim-airline settings
      " let g:airline_theme="bubblegum"
      " let g:airline_theme="violet"
      let g:airline_theme="alduin"

      " set colors --> gruvbox nord jellybeans
      colorscheme jellybeans
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

  # ??? fragezeichen
  #xdg = {
  #  enable = true;
  #};

}
