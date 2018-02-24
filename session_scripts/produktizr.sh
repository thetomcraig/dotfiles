export EVENT_NOKQUEUE=1

name=$1
path="${HOME}/dev/"
cd $path
tmux -u new-session -d -s 'produktizr'

tmux new-window -t $1:1 -n Backend-Server
tmux new-window -t $1:2 -n Text
tmux new-window -t $1:3 -n ZSH 
tmux new-window -t $1:4 -n Buffer 
tmux new-window -t $1:5 -n Frontend-Server
tmux new-window -t $1:6 -n Text
tmux new-window -t $1:7 -n ZSH 

tmux select-window -t produktizr:1

tmux send-keys -t $name:1 "cd produktizr-back-end" C-m C-m
tmux send-keys -t $name:1 "env/bin/python manage.py runserver 0.0.0.0:9000" C-m C-m

tmux send-keys -t $name:2 "cd produktizr-back-end" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m

tmux send-keys -t $name:3 "cd produktizr-back-end" C-m C-m

# Buffer window

tmux send-keys -t $name:5 "cd produktizr-front-end" C-m C-m
tmux send-keys -t $name:5 "npm start" C-m C-m

tmux send-keys -t $name:6 "cd produktizr-front-end" C-m C-m
tmux send-keys -t $name:6 "vim" C-m C-m

tmux send-keys -t $name:7 "cd produktizr-front-end" C-m C-m
