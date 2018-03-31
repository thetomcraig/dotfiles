export EVENT_NOKQUEUE=1

cd $1
tmux -u new-session -d -s $2

tmux new-window -t $2:1 -n Backend-Server
tmux new-window -t $2:2 -n Text
tmux new-window -t $2:3 -n ZSH 
tmux new-window -t $2:4 -n Buffer 
tmux new-window -t $2:5 -n Frontend-Server
tmux new-window -t $2:6 -n Text
tmux new-window -t $2:7 -n ZSH 

tmux select-window -t produktizr:1

tmux send-keys -t $2:1 "cd $1/produktizr-back-end" C-m C-m
tmux send-keys -t $2:1 "env/bin/python manage.py runserver 0.0.0.0:9000" C-m C-m

tmux send-keys -t $2:2 "cd $1/produktizr-back-end" C-m C-m
tmux send-keys -t $2:2 "vim" C-m C-m

tmux send-keys -t $2:3 "cd $1/produktizr-back-end" C-m C-m

# Buffer window

tmux send-keys -t $2:5 "cd $1/produktizr-front-end" C-m C-m
tmux send-keys -t $2:5 "npm start" C-m C-m

tmux send-keys -t $2:6 "cd $1/produktizr-front-end" C-m C-m
tmux send-keys -t $2:6 "vim" C-m C-m

tmux send-keys -t $2:7 "cd $1/produktizr-front-end" C-m C-m
