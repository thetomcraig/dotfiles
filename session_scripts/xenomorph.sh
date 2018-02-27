export EVENT_NOKQUEUE=1

name="xenomorph"
path="~/Dropbox/TomCraig/Projects/Xenomorph/"
tmux -u new-session -d -s $name

tmux new-window -t $1:1 -n ZSH
tmux new-window -t $1:2 -n Text

tmux select-window -t $name:1

tmux send-keys -t $name:1 "cd $path" C-m C-m

tmux send-keys -t $name:2 "cd $path" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m
