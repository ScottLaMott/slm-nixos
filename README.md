# slm-nixos
---
## protokoll, unvollständig
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

  - powerlevel10k plugin installiert (prompt)
    - in das $HOME/.zplug/repos verzeichnis

## fragen und antworten
  f - sind .nix dateien konfigurationsdateien ?
  a - yes, irgendwie schon, sie sind aber auch quellcode
