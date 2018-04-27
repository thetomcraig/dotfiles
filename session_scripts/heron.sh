export EVENT_NOKQUEUE=1

name="heron"
main_path=$1/HERON
dispatcher_path=$1/Discord-Dispatcher

cd $main_path
tmux -u new-session -d -s $2

tmux new-window -t $2:1 -n Server
tmux new-window -t $2:2 -n Text
tmux new-window -t $2:3 -n ZSH 
tmux new-window -t $2:4 -n Buffer
tmux new-window -t $2:5 -n Vim 
tmux new-window -t $2:6 -n ZSH 

tmux send-keys -t $name:1 "cd $main_path" C-m C-m
tmux send-keys -t $name:1 "source env/bin/activate" C-m C-m
tmux send-keys -t $name:1 "cd heron && python manage.py runserver" C-m C-m

tmux send-keys -t $name:2 "cd $main_path" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m

tmux send-keys -t $name:3 "cd $main_path" C-m C-m

tmux send-keys -t $name:4 "cd $1" C-m C-m

tmux send-keys -t $name:5 "cd $dispatcher_path" C-m C-m
tmux send-keys -t $name:5 "vim" C-m C-m

tmux send-keys -t $name:6 "cd $dispatcher_path" C-m C-m

