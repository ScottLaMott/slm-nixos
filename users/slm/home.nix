{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "slm";
  home.homeDirectory = "/home/slm";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  ### slm started here

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
    # zsh-history
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      c  = "clear";
    };
    initExtra = ''
      #
      # declared in home.nix with programs.bash.initExtra / slm
      #
      neofetch
      set -o vi
    '';
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      c  = "clear";
      cp = "cp -i";
      ls = "lsd";
      mv = "mv -i";
      rm = "rm -i";
      # ls = "ls --color=tty";
    };
    zplug = {
      enable = true;
      plugins = [
        # { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
        { name = "jeffreytse/zsh-vi-mode"; } # better vi-mode integration

      ];
    };
    initExtra = ''
      #
      # declared in home.nix with programs.zsh.initExtra / slm
      #

      # slm trick
      source $HOME/ws/zsh-nix-shell/.config/zsh/zshrc
      source $HOME/.p10k.zsh

      # nice terminal colorscheme
      /usr/bin/theme.sh dracula
      #/usr/bin/theme.sh papercolor-dark
      # /usr/bin/theme.sh jellybeans
    '';
  };

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

  # fzf declaration
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--layout=reverse"
      "--info=inline"
      ];
  };

  # ??? fragezeichen
  xdg = {
    enable = true;
  };

}
