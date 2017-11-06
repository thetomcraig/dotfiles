export EVENT_NOKQUEUE=1

name=$1
sling_path="${HOME}/dev/$name/SavageBeast/Engineering/projects/aap"
cd $sling_path
tmux -u new-session -d -s $name

tmux send-keys "startpg" "C-m"
tmux new-window -t $1:1 -n Sever
tmux new-window -t $1:2 -n NPM
tmux new-window -t $1:3 -n Redis
tmux new-window -t $1:4 -n Celery
tmux new-window -t $1:5 -n Shell
tmux new-window -t $1:6 -n Vim
tmux new-window -t $1:7 -n ZSH

tmux send-keys -t $name:1 "tmux rename-window -t 1 ' '" C-m C-m
tmux send-keys -t $name:1 "env/bin/python web/aap/manage.py runserver"

tmux send-keys -t $name:2 "tmux rename-window -t 2 ' '" C-m C-m
tmux send-keys -t $name:2 "npm run dev" C-m

tmux send-keys -t $name:3 "tmux rename-window -t 3 ' '" C-m C-m
tmux send-keys -t $name:3 "redis-server"

tmux send-keys -t $name:4 "tmux rename-window -t 4 ' '" C-m C-m
tmux send-keys -t $name:4 "cd web/aap && ../../env/bin/celery -A slingshot worker"

tmux send-keys -t $name:5 "tmux rename-window -t 5 ' '" C-m C-m
tmux send-keys -t $name:5 "env/bin/python web/aap/manage.py shell" C-m

tmux send-keys -t $name:6 "tmux rename-window -t 6 ' '" C-m C-m
tmux send-keys -t $name:6 "vim" C-m C-m

tmux send-keys -t $name:7 "tmux rename-window -t 7 ' '" C-m C-m
