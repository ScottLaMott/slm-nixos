# SLM-NIXOS
---
Mein erstes NixOS-System. Benutzerverwaltung mit home-Manager.

- NixOS-System bauen<br>
  ```
  # Build system
  > sudo nixos-rebuild switch
  ```
- _/etc/nixos/configuration.nix_<br>
  Datei mit systemweiten Einstellungen.
  ```
  # Dokumentation aller Optionen
  > man configuration.nix
  ```
- Benutzer konfigurieren<br>
  ```
  # Build user
  > home-manger switch
  ```
- $HOME/ws/slm-nixos/users/slm/home.nix<br>
  Dateien mit Benutzereinstellnugen. Anzeigen aller Optionen mit
  ```
  # Dokumentation aller Optionen
  > man home-configuration.nix
  ```
<br>

## Protokoll, unvollständig

- wichtig für fzf/zsh-history, muss in zshrc sein
```
# slm ---------------------------------
# Jump to begin of line / insert mode command line history
zle-history-line-set () {
    zle vi-beginning-of-line;
    zle vi-cmd-mode;
}
zle -N zle-history-line-set
```

- Fonts für AwesomeWM in _awesome/rc.lua_ eingestellt. FontName _Hack_ schaut gut aus.
>
- zsh wird nun komplett durch den home-manager gesteuert, ist deutlich schneller<br>

  - https://nixos.wiki/wiki/Home-Manager ## md link machen

  - symlinks für /etc/nixos/configuration.nix und ~/.config/nixpkgs/home.nix erstellt
  - Home-Manager systemweit installiert

  - Terminal alacritty mit lokaler Konfigurationsatei in **.config/alacritty/alacritty.yml**, nicht mit nix gebaut
  - terminal colorscheme mit theme.sh (github) einstellen

  - WindowManager awesome mit lokaler config-datei in **.config/awesome/rc.lua**, nicht mit nix gebaut
  - auflösung für Bildschirm in configuration.nix eingestellt (1600x900)

  - Git-Integration nach YouTube-Videoanleitung von Wil T. (noch nicht fertig)
    [How to put nixos config int Git](https://www.youtube.com/watch?v=Dy3KHMuDNS8)

  - zplugin manager installiert
    - im $HOME/.zplug verzeichnis

  - zsh-vi-mode plugin installiert (bessere vi-unterstützung in zsh)
    - in das $HOME/.zplug/repos verzeichnis
    - Init-Funktion für zvm-vi-mode home.nix

  - powerlevel10k plugin installiert (prompt)
    - in das $HOME/.zplug/repos verzeichnis

## Fragen und Antworten
Q: Sind .nix Dateien Konfigurationsdateien ?<br>
A: ja, irgendwie schon, sie sind aber auch Quellcode.<br>
