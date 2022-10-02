# TODO

## spotify account aendern oder repo privatisieren

### todo very first
- ranger fehler, scope.sh nicht gefunden
- git integragtion mit links
  - ist in arbeit
  - git-crypt für passwörter und secrets, siehe oben
  - fernziel stow ???

### todo first

- zvm, zsh-vi-mode-plugin verbessern
  -  zsh-vi-mode-plugin verbessern
  - line-mode nach suchen - command versus insert, ich möchte immer command-mode
- zplug (ZPLUG-Variabelen checken, .zplug, ...)

- Fehler
  ```
  ~/ws/enterprise master*
  ❮ ranger
  Preview script `/nix/store/gdymqfbnmrjc9c60flnxlf622bmdygdg-ranger-1.9.3/share/doc/ranger/config/scope.sh` doesn't exist!

  ~/ws/enterprise master*
  ❯
  ```

### todo
- vim mit grünen colorscheme
- tig/vim integration
- passsword manager
- slm-art in github einchecken
- nixos auf bare-metal
- rofi installieren
- display acceleration
  - 'vainfo' fehler beseitigen
- fonts installieren, fehlerhafte zeichen ins lsd, vim-airline, etc, ...
- ranger vorschau
  - w3mimagedisplay kann nicht aufgrufen werden, geht nicht in alacritty ???
  - ueberzug versuchen
  - colorschemes, in welchem verzeichnis müssen die colorschemes hinterlegt werden
    - colorschemes brauchen py endung
    - git, python bytecode nicht einchecken

### done
- fehler aufruf vim -S session.vim, fehlermeldung auswerten
  - lösung: nixos.vim war in .gitignore. folge fd ignoriert dateien in .gitignore
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
  - lokale benutzerfonts in
  ```
  ~/.nix-profile/share/fonts
  ```
  - resolution auf 1600x900 gesetzt, das ist die lösung für kleine schrift in brave usw.

- zsh login-shell als default-shell

- zsh aufruf dauert lange, powerlevel10k
  - Ursache: program.zsh.enable in Systemkonfiguration (/etc/nixos/configuration.nix) und Userkonfigurations (home-manager)
  - Lösung: zsh in home-manager enabled

- zvm, zsh-vi-mode-plugin verbessern
  - in home.nix bei programs.zsh.initExtra

- farbige man-pages
  durch terminal colors gelöst, nein slm-plugin wird gebraucht

#### to-read
- nix manual
- home-manager manual
