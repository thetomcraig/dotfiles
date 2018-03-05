export EVENT_NOKQUEUE=1

cd=$1
tmux -u new-session -d -s $2

tmux send-keys "startpg" "C-m"
tmux new-window -t $2:1 -n Sever
tmux new-window -t $2:2 -n NPM
tmux new-window -t $2:3 -n Redis
tmux new-window -t $2:4 -n Celery
tmux new-window -t $2:5 -n Shell
tmux new-window -t $2:6 -n Vim
tmux new-window -t $2:7 -n ZSH

tmux send-keys -t $2:1 "tmux rename-window -t 1 ' '" C-m C-m
tmux send-keys -t $2:1 "cd web/aap" C-m C-m
tmux send-keys -t $2:1 "source ~/.pyenv/versions/slingshot_develop/bin/activate && python manage.py runserver"

tmux send-keys -t $2:2 "tmux rename-window -t 2 ' '" C-m C-m
tmux send-keys -t $2:2 "npm run dev" C-m

tmux send-keys -t $2:3 "tmux rename-window -t 3 ' '" C-m C-m
tmux send-keys -t $2:3 "redis-server"

tmux send-keys -t $2:4 "tmux rename-window -t 4 ' '" C-m C-m
tmux send-keys -t $2:4 "cd web/aap && ../../env/bin/celery -A slingshot worker"

tmux send-keys -t $2:5 "tmux rename-window -t 5 ' '" C-m C-m
tmux send-keys -t $2:5 "cd web/aap" C-m C-m
tmux send-keys -t $2:5 "source ~/.pyenv/versions/slingshot_develop/bin/activate" C-m C-m
tmux send-keys -t $2:5 "python manage.py shell"

tmux send-keys -t $2:6 "tmux rename-window -t 6 ' '" C-m C-m
tmux send-keys -t $2:6 "vim" C-m C-m

tmux send-keys -t $2:7 "tmux rename-window -t 7 ' '" C-m C-m
