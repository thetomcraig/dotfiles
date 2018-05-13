export EVENT_NOKQUEUE=1

name="total-immersion-podcast"
path=$1/total-immersion-podcast

cd $path
tmux -u new-session -d -s $2

tmux new-window -t $1:1 -n Text
tmux send-keys -t $name:1 "cd ~/Dropbox/TomCraig/Projects/total-immersion-podcast/" C-m C-m
tmux send-keys -t $name:1 "vim" C-m C-m
