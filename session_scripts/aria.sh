export EVENT_NOKQUEUE=1

name=$1
aria_path="${HOME}/dev/ciui-react"
cd $aria_path
tmux -u new-session -d -s $name

tmux send-keys "startpg" "C-m"
tmux new-window -t $1:1 -n NPM
tmux new-window -t $1:2 -n Vim
tmux new-window -t $1:3 -n ZSH

tmux send-keys -t $name:1 "tmux rename-window -t 1 ' '" C-m C-m
tmux send-keys -t $name:1 "yarn start"

tmux send-keys -t $name:2 "tmux rename-window -t 2 ' '" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m

tmux send-keys -t $name:3 "tmux rename-window -t 3 ' '" C-m C-m

