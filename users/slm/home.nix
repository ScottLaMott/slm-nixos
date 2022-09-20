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
    btop cmatrix feh figlet gdu gnupg ipcalc kitty lsd neovim powerline-fonts xorg.xeyes
  ];

  #--------------------------------------------------------------------------------
  # zsh configuration
  #
  programs.zsh = {

    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting= true;

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
      echo "config.xdg.configHome = ${config.xdg.configHome} ...."
      echo "config.xdg.dataHome   = ${config.xdg.dataHome} ...."

      source ${config.xdg.configHome}/zsh/slm-zshrc

      [ -f  ${config.xdg.dataHome}/zsh/shell/slm-aliases ]           && source ${config.xdg.dataHome}/zsh/shell/slm-aliases
      [ -f  ${config.xdg.dataHome}/zsh/shell/slm-colored-man-pages ] && source ${config.xdg.dataHome}/zsh/shell/slm-colored-man-pages

      source ${config.xdg.configHome}/powerlevel10k/.p10k.zsh

      # set terminal colorscheme --> papercolor-dark jellybeans dracula 
      # black-metal-mayhem
      /usr/bin/theme.sh black-metal-nile

      # init function for zvm
      function zvm_config() {
        ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
      }
      zvm_config
      # fzf-history-widget with <CTRL>-r,  in viins and vicmd mode
      zvm_after_init_commands+=('bindkey -M viins '^R' fzf-history-widget')

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
    plugins = with pkgs; [
      # colorscheme
      vimPlugins.dracula-vim vimPlugins.gruvbox vimPlugins.jellybeans-vim vimPlugins.nord-vim

      # airline
      vimPlugins.vim-airline vimPlugins.vim-airline-themes

      # the best of the rest
      vimPlugins.markdown-preview-nvim
      vimPlugins.vim-nix
      vimPlugins.vim-vinegar
      vimPlugins.vim-fugitive
    ];

    settings = {
      number = true;
      relativenumber  = true;
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
    };

    extraConfig  = ''
      "--------------------------------------------------------------------------------
      " declared in home.nix / by slm
      "
      " settings
      " set background=dark
      set scrolloff=10
      set cursorline
      set noswapfile

      " netrw settings
      let netrw_banner="1"
      let netrw_liststyle="2"
      let netrw_sizestyle="H"

      " set vim-airline --> "bubblegum" "violet" "alduin"
      let g:airline_theme="bubblegum"

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
