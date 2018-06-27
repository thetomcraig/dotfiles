export EVENT_NOKQUEUE=1
name=$1
path=$2

tmux new-window -t $name:2 -n Text
tmux new-window -t $name:3 -n ZSH 

tmux select-window -t $name:1

tmux send-keys -t $name:1 "cd $path" C-m C-m

tmux send-keys -t $name:2 "cd $path" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m
