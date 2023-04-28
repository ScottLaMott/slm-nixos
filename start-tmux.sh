#!/run/current-system/sw/bin/bash
cd ~/ws/slm-nixos

session="slm-nixos"

tmux new-session      -d -s $session   # new session, new window named/indexed 1

window=1
tmux rename-window    -t $session:$window 'edit'   # rename window 1
tmux send-keys        -t $session:$window 'vim -S nixos.vim' C-m

window=2
tmux new-window       -t $session:$window -n 'build'
tmux send-keys        -t $session:$window 'nf' C-m

window=3
tmux new-window       -t $session:$window -n 'shell'
tmux send-keys        -t $session:$window 'nf' C-m

tmux select-window    -t $session:1

tmux attach-session   -t $session

