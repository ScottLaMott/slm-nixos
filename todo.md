# TODO

### spotify account aendern oder repo privatisieren

### todo very first
- git - token, git-credential helper korrekt konfigurieren
- Git-Integragtion mit symlinks
  - ist in Arbeit
  - git-crypt für Passwörter und Secrets, siehe oben
  - fernziel stow ???
- virsh/virt-viewer in kombination mit nixos-vms
- mail client installieren
- ranger
  - Vorschau Bilddateien
  - Fehlemeldung wenn ranger beendet wird

### todo first
- terminal transperence
- zvm, zsh-vi-mode-plugin verbessern
  -  zsh-vi-mode-plugin verbessern
  - line-mode nach suchen - command versus insert, ich möchte immer command-mode
- zplug (ZPLUG-Variabelen checken, .zplug, ...)

### todo
- rofi konfigurieren
- vim mit grünen colorscheme
- tig/vim integration
- passsword manager
- slm-art in github einchecken
- nixos auf bare-metal
- display acceleration
  - 'vainfo' fehler beseitigen
- fonts installieren, fehlerhafte zeichen ins lsd, vim-airline, etc, ...
- ranger vorschau
  - w3mimagedisplay kann nicht aufgrufen werden, geht nicht in alacritty ???
  - ueberzug versuchen

### done
- Fehler: aufruf vim -S session.vim, fehlermeldung auswerten
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
- Fehler:
  ```
  ~/ws/enterprise master*
  ❮ ranger
  Preview script `/nix/store/gdymqfbnmrjc9c60flnxlf622bmdygdg-ranger-1.9.3/share/doc/ranger/config/scope.sh` doesn't exist!
  ~/ws/enterprise master*
  ❯
  ```
  -- Lösung: scope.sh in .config/ranger gelöscht, ranger-pkgs gelöscht, ranger-pkgs neuinstalliert
- Goyo und Limeline installiert (vim-plugin)
- rofi installiert
- git, python bytecode nicht einchecken,
  - in .gitignore eingetragen, wenn datei schon zum Git-Repo hinzugefügt sind mit 'git rm --cached' aus Cache löschen
- purification installiert, neuer minimaler prompt. macht einiges in der shell schneller und flüssiger.
- home-manager - channel update auf nixos 22.10
- alacritty colorscheme in alacritty.yml gesetzt. siehe import-statement
- nixos - update auf nixos 22.10

#### to-read
- nix manual
- home-manager manual
