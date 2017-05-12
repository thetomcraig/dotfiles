export EVENT_NOKQUEUE=1
name=$1
tmux -u new-session -d -s $name
sling_path="${HOME}/dev/$name/SavageBeast/Engineering/projects/aap"
cd $sling_path

tmux send-keys "startpg" "C-m"
tmux new-window -t $1:1 -n Sever
tmux new-window -t $1:2 -n NPM
tmux new-window -t $1:3 -n Redis
tmux new-window -t $1:4 -n Celery
tmux new-window -t $1:5 -n Shell
tmux new-window -t $1:6 -n Vim
tmux new-window -t $1:7 -n ZSH

tmux send-keys -t $name:1 "cd $sling_path" "C-m"
tmux send-keys -t $name:1 "tmux rename-window -t 1 ' '" "C-m"
tmux send-keys -t $name:1 "slingenv" "C-m"
tmux send-keys -t $name:1 "clear" "C-m"
tmux send-keys -t $name:1 "python manage.py runserver"

tmux send-keys -t $name:2 "cd $sling_path" "C-m"
tmux send-keys -t $name:2 "tmux rename-window -t 2 ' '" "C-m"
tmux send-keys -t $name:2 "slingenv" "C-m"
tmux send-keys -t $name:2 "clear" "C-m"
tmux send-keys -t $name:2 "npm run dev"

tmux send-keys -t $name:3 "cd $sling_path" "C-m"
tmux send-keys -t $name:3 "tmux rename-window -t 3 ' '" "C-m"
tmux send-keys -t $name:3 "clear" "C-m"
tmux send-keys -t $name:3 "redis-server" # "C-m"

tmux send-keys -t $name:4 "cd $sling_path" "C-m"
tmux send-keys -t $name:4 "slingenv" "C-m"
tmux send-keys -t $name:4 "cd $sling_path/web/aap" "C-m"
tmux send-keys -t $name:4 "tmux rename-window -t 4 ' '" "C-m"
tmux send-keys -t $name:4 "clear" "C-m"
tmux send-keys -t $name:4 "celery -A slingshot worker" # "C-m"

tmux send-keys -t $name:5 "cd $sling_path" "C-m"
tmux send-keys -t $name:5 "tmux rename-window -t 5 ' '" "C-m"
tmux send-keys -t $name:5 "slingenv" "C-m"
tmux send-keys -t $name:5 "slingshell" "C-m"

tmux send-keys -t $name:6 "cd $sling_path" "C-m"
tmux send-keys -t $name:6 "tmux rename-window -t 6 ' '" "C-m"
tmux send-keys -t $name:6 "vim" "C-m"
tmux send-keys -t $name:6 "FF"

tmux send-keys -t $name:7 "cd $sling_path" "C-m"
tmux send-keys -t $name:7 "tmux rename-window -t 7 ' '" "C-m"
tmux send-keys -t $name:7 "slingenv" "C-m"
