export EVENT_NOKQUEUE=1
name=$1
path=$2

tmux new-window -t $name:2 -n NPM
tmux new-window -t $name:3 -n Text
tmux new-window -t $name:4 -n ZSH 

tmux select-window -t $name:1
tmux send-keys "startpg" "C-m"

tmux new-window -t $name:2 -n NPM
tmux new-window -t $name:3 -n Redis
tmux new-window -t $name:4 -n Celery
tmux new-window -t $name:5 -n Shell
tmux new-window -t $name:6 -n Vim
tmux new-window -t $name:7 -n ZSH

tmux send-keys -t $name:1 "tmux rename-window -t 1 ' '" C-m C-m
tmux send-keys -t $name:1 "cd $path/projects/aap/web/aap" C-m C-m
tmux send-keys -t $name:1 "python manage.py runserver" C-m C-m

tmux send-keys -t $name:2 "tmux rename-window -t 2 ' '" C-m C-m
tmux send-keys -t $name:1 "cd $path/projects/aap" C-m C-m
tmux send-keys -t $name:2 "npm run dev" C-m C-m

tmux send-keys -t $name:3 "tmux rename-window -t 3 ' '" C-m C-m
tmux send-keys -t $name:3 "cd $path && redis-server " C-m C-m

tmux send-keys -t $name:4 "tmux rename-window -t 4 ' '" C-m C-m
tmux send-keys -t $name:4 "cd $path/projects/aap/web/aap" C-m C-m
tmux send-keys -t $name:4 "celery -A slingshot worker" C-m C-m

tmux send-keys -t $name:5 "tmux renate-window -t 5 ' '" C-m C-m
tmux send-keys -t $name:5 "cd $path/projects/aap/web/aap" C-m C-m
tmux send-keys -t $name:5 "python manage.py shell" C-m C-m

tmux send-keys -t $name:6 "tmux rename-window -t 6 ' '" C-m C-m
tmux send-keys -t $name:6 "cd $path/projects/aap" C-m C-m
tmux send-keys -t $name:6 "vim" C-m C-m

tmux send-keys -t $name:7 "tmux rename-window -t 7 ' '" C-m C-m
tmux send-keys -t $name:7 "cd $path/projects/aap/web/aap" C-m C-m
