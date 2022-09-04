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

  home.packages = [
    pkgs.btop
    pkgs.gdu
    pkgs.cmatrix
    pkgs.powerline-fonts
    pkgs.speedtest-cli
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
      #
      # declared in home.nix / by slm
      #
      neofetch
      set -o vi
    '';
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      c  = "clear";
      # confirm before overwriting something
      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";
    };
    initExtra = ''
      #
      # declared in home.nix /by slm
      #
      neofetch
      bindkey -v
    '';
  };

  programs.vim = {
    enable = true;
    plugins = [
      pkgs.vimPlugins.gruvbox
      pkgs.vimPlugins.jellybeans-vim
      pkgs.vimPlugins.markdown-preview-nvim
      pkgs.vimPlugins.nord-vim
      pkgs.vimPlugins.vim-airline
      pkgs.vimPlugins.vim-airline-themes
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
      set scrolloff=10
      set cursorline
      set noswapfile

      " netrw settings
      let netrw_banner="1"
      let netrw_liststyle="2"
      let netrw_sizestyle="H"

      " vim-airline settings
      " let g:airline_theme="bubblegum"
      let g:airline_theme="violet"

      " set colors --> gruvbox nord jellybeans
      colorscheme jellybeans
    '';
  };

  # ??? fragezeichen
  xdg = {
    enable = true;
  };

}
