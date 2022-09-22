slm-nixos
---
Repository für mein NIXOS-System.
- /etc/nixos/configuration.nix
- Benutzerkonfiguration mit Home-Manager

## protokoll, unvollständig
  - fonts in awesome config eingestellt, Hack schaut gut aus
  - zsh wird nun komplett durch den home-manager gesteuert, ist deutlich schneller.
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
