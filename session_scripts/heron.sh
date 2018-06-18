export EVENT_NOKQUEUE=1
name=$1
path=$2

name="heron"
main_path=$path/HERON
dispatcher_path=$path/Discord-Dispatcher

cd $main_path

tmux new-window -t $name:1 -n Server
tmux new-window -t $name:2 -n Text
tmux new-window -t $name:3 -n ZSH 
tmux new-window -t $name:4 -n Buffer
tmux new-window -t $name:5 -n Vim 
tmux new-window -t $name:6 -n ZSH 

tmux send-keys -t $name:1 "cd $main_path" C-m C-m
tmux send-keys -t $name:1 "source env/bin/activate" C-m C-m
tmux send-keys -t $name:1 "cd heron && python manage.py runserver" C-m C-m

tmux send-keys -t $name:2 "cd $main_path" C-m C-m
tmux send-keys -t $name:2 "vim" C-m C-m

tmux send-keys -t $name:3 "cd $main_path" C-m C-m

tmux send-keys -t $name:4 "cd $path" C-m C-m

tmux send-keys -t $name:5 "cd $dispatcher_path" C-m C-m
tmux send-keys -t $name:5 "vim" C-m C-m

tmux send-keys -t $name:6 "cd $dispatcher_path" C-m C-m

