
export EVENT_NOKQUEUE=1
name=$1
path=$2

tmux new-window -t $name:1 -n Backend-Server
tmux new-window -t $name:2 -n Text
tmux new-window -t $name:3 -n ZSH 
tmux new-window -t $name:4 -n Buffer 
tmux new-window -t $name:5 -n Frontend-Server
tmux new-window -t $name:6 -n Text
tmux new-window -t $name:7 -n ZSH 

tmux select-window -t produktizr:1

tmux send-keys -t $name:1 "cd $path/produktizrapi" C-m C-m
tmux send-keys -t $name:1 "python manage.py runserver 0.0.0.0:9000" C-m C-m

tmux send-keys -t $name:2 "cd $path/produktizrapi" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m

tmux send-keys -t $name:3 "cd $path/produktizrapi" C-m C-m

# Buffer window

tmux send-keys -t $name:5 "cd $path/produktizr-front-end" C-m C-m
tmux send-keys -t $name:5 "nvm use 8.9.4" C-m C-m
tmux send-keys -t $name:5 "npm start" C-m C-m

tmux send-keys -t $name:6 "cd $path/produktizr-front-end/src" C-m C-m
tmux send-keys -t $name:6 "vim" C-m C-m

tmux send-keys -t $name:7 "cd $path/produktizr-front-end" C-m C-m
