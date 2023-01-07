"                                                _                   "
" ___ _   _ _ __   ___ _ __       ___ ___   ___ | | ___  ___         "
"/ __| | | | '_ \ / _ \ '__|____ / __/ _ \ / _ \| |/ _ \/ __|        "
"\__ \ |_| | |_) |  __/ | |_____| (_| (_) | (_) | |  __/\__ \  _ _ _ "
"|___/\__,_| .__/ \___|_|        \___\___/ \___/|_|\___||___/ (_|_|_)"
          |_|
----------------------------------------------------------------------------------

# According to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source ${0:h}/zsh-vi-mode.zsh


