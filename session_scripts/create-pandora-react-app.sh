export EVENT_NOKQUEUE=1

cd $1
tmux -u new-session -d -s $2

tmux new-window -t $2:2 -n NPM
tmux new-window -t $2:3 -n Text
tmux new-window -t $2:4 -n ZSH 

tmux select-window -t $2:1

tmux send-keys -t $2:1 "cd $1" C-m C-m
tmux send-keys -t $2:1 "cd $2" C-m C-m
tmux send-keys -t $2:1 "nvm use 8.9.4" C-m C-m
tmux send-keys -t $2:1 "npm start" C-m C-m

tmux send-keys -t $2:2 "cd $1" C-m C-m
tmux send-keys -t $2:2 "cd $2/src" C-m C-m
tmux send-keys -t $2:2 "vim" C-m C-m

tmux send-keys -t $2:3 "cd $1" C-m C-m
tmux send-keys -t $2:3 "cd $2" C-m C-m
