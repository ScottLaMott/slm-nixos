### nixos
---

### todo very first
- git integragtion mit links

### todo first
- zvm, zsh-vi-mode-plugin verbessern
  - line-mode nach suchen - command versus insert, ich möchte immer command-mode
- zplug (ZPLUG-Variabelen checken, .zplug, ...)
- zsh aufruf dauert lange, powerlevel10k
  - mit zprof untersuchen

### todo
- nixos auf bare-metal
- display acceleration
  - `vainfo' fehler beseitigen
- fonts installieren, fehlerhafte zeichen ins lsd, vim-airline, etc, ...
- ranger vorschau

### done
- vim-plugins ans laufen gebracht, eintrag in ~/.config/nixpkgs/home.nix
  - markdown-preview-nvim
  - nord-vim
  - vim-airline
  - vim-airline-themes
  - vim-vinegar
  - vim-fugitive

- system fonts vergrößern
  - komplette nerdfonts installiert, ist ein bisschen viel !!!
  - nerdfonts gezielt installiert (FiraCode, DroidSansMono) in configuration.nix
  - lokale benutzerfonts in ```~/.nix-profile/share/fonts```
  - resolution auf 1600x900 gesetzt, das ist die lösung für kleine schrift in brave usw.

- zsh login-shell als default-shell

- zvm, zsh-vi-mode-plugin verbessern
  - in home.nix bei programs.zsh.initExtra

- farbige man-pages
  durch terminal colors gelöst

#### to-read
- nix manual
- home-manager manual
