### nixos
---
### todo first
- zvm, zsh-vi-mode-plugin verbessern
  - konflikt mit fzf
  - line-mode nach suchen - command versus insert, ich möchte immer command-mode
- git integragtion
- zsh aufruf dauert lange, powerlevel10k ????

### todo
- nixos auf bare-metal
- display acceleration
  - `vainfo' fehler beseitigen
- fonts installieren, fehlerhafte zeichen ins lsd, vim-airline, etc, ...
- farbige man-pages

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

#### to-read
- nix manual
- home-manager manual
