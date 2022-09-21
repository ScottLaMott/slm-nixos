# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{ imports =
  [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos-one"; # Define your hostname.
  # networking.wireless.enable = true; # Enables wireless support via
  # wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.utf8";

  i18n.extraLocaleSettings = { LC_ADDRESS = "de_DE.utf8";
    LC_IDENTIFICATION = "de_DE.utf8"; LC_MEASUREMENT = "de_DE.utf8";
    LC_MONETARY = "de_DE.utf8"; LC_NAME = "de_DE.utf8"; LC_NUMERIC =
    "de_DE.utf8"; LC_PAPER = "de_DE.utf8"; LC_TELEPHONE = "de_DE.utf8";
    LC_TIME = "de_DE.utf8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.resolutions = [
    {
      x = 1600; y = 900;
    }
  ];
  # Enable window manager
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.windowManager.dwm.enable = true;
  # Enable the Cinnamon Desktop Environment.
  # ....
  # Enable login manager
  services.xserver.displayManager.lightdm.enable = true;

  # test -remove until dash- services.xserver.videoDrivers = [ "intel" ];
  #services.xserver.videoDrivers = [ "modesetting" ];
  #services.xserver.useGlamor = true;

  #services.xserver.videoDrivers = [ "intel" ];
  #services.xserver.deviceSection = ''
  #  Option "DRI" "2"
  #  Option "TearFree" "true"
  #'';

  # Configure keymap in X11
  services.xserver = { layout = "de"; xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true; hardware.pulseaudio.enable = false;
  security.rtkit.enable = true; services.pipewire = {
    enable = true; alsa.enable = true; alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this jack.enable =
    #true;

    # use the example session manager (no others are packaged yet so
    # this is enabled by default, no need to redefine it in your config
    # for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  #  user account for slm / Scott LaMott
  users.users.slm.isNormalUser = true;
  users.users.slm.description = "Scott LaMott";
  users.users.slm.extraGroups = [ "networkmanager" "wheel" ];
  users.users.slm.shell = pkgs.zsh;

  # test user
  users.users.guest.isNormalUser = true;
  users.users.guest.description = "G. Uest";
  users.users.guest.extraGroups = [ "networkmanager" "wheel" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run: $ nix
  # search wget
  environment.systemPackages = with pkgs; [
   alacritty
   bat
   brave
   curl
   dmenu
   fd
   file
   firefox
   fzf
   git
   htop
   killall
   nmap
   neofetch
   pulsemixer
   python
   ranger
   ripgrep
   speedtest-cli
   stow
   tmux
   tree
   tldr
   wget
  ];

  # add zsh to /etc/shells
  environment.shells = with pkgs; [ zsh ];
  # needed for system package completion
  environment.pathsToLink = [ "/share/zsh" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions. programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true; enableSSHSupport = true;
  # };

  # shell environment
  programs.vim.defaultEditor = true;
  # enable zsh
  programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon. services.openssh.enable = true;
  services.openssh.enable = true;

  # Open ports in the firewall. networking.firewall.allowedTCPPorts = [
  # ... ]; networking.firewall.allowedUDPPorts = [ ... ]; Or disable the
  # firewall altogether. networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database
  # versions on your system were taken. It‘s perfectly fine and
  # recommended to leave this value at the release version of the first
  # install of this system. Before changing this value read the
  # documentation for this option (e.g. man configuration.nix or on
  # https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

  # fonts.fontconfig.enable = true;
  # fonts.fontconfig.localConf = "FiraCode";
  fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" ]; })
    ];
}
