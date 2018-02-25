export EVENT_NOKQUEUE=1

tmux -u new-session -d -s 'total-immersion-podcast'

tmux new-window -t $1:1 -n Text
tmux send-keys -t $name:1 "cd ~/Dropbox/TomCraig/Projects/total-immersion-podcast/" C-m C-m
tmux send-keys -t $name:1 "spacemacs" C-m C-m
