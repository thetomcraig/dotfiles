export EVENT_NOKQUEUE=1

name="heron"
path=$1/HERON

cd $path
tmux -u new-session -d -s $2

tmux new-window -t $2:1 -n Server
tmux new-window -t $2:2 -n Text
tmux new-window -t $2:3 -n ZSH 

tmux send-keys -t $name:1 "cd $path" C-m C-m
tmux send-keys -t $name:1 "source env/bin/activate" C-m C-m
tmux send-keys -t $name:1 "cd heron && python manage.py runserver" C-m C-m

tmux send-keys -t $name:2 "cd $path" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m

tmux send-keys -t $name:3 "cd $path" C-m C-m
