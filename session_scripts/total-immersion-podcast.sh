export EVENT_NOKQUEUE=1
name=$1
path=$2

# Setup windows/panes
tmux new-window -t $name:2 -n VIM

tmux send-keys -t $name:2 "cd $path" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m
tmux send-keys -t $name:2 ":call AutoCorrect()" C-m C-m
tmux send-keys -t $name:2 ":set spell spelllang=en_us" C-m C-m
