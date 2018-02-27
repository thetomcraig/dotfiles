export EVENT_NOKQUEUE=1

name="heron"
path="~/Dropbox/TomCraig/Projects/HERON/"
tmux -u new-session -d -s 'heron'

tmux new-window -t $1:1 -n Server
tmux new-window -t $1:2 -n Text
tmux new-window -t $1:3 -n ZSH 

tmux select-window -t produktizr:1

tmux send-keys -t $name:1 "cd $path" C-m C-m
tmux send-keys -t $name:1 "env/bin/python manage.py runserver" C-m C-m

tmux send-keys -t $name:2 "cd $path" C-m C-m
tmux send-keys -t $name:2 "spacemacs" C-m C-m

tmux send-keys -t $name:3 "cd $path" C-m C-m
