export EVENT_NOKQUEUE=1

project_path=''
case $HOSTNAME in
    (ZENO.local) project_path=${HOME}/Dropbox/TomCraig/Projects/EROS;;
    (tcraig-m01) project_path={$HOME}/EROS;;
    (*)   echo "How did I get in the middle of nowhere?";;
esac

name='eros'
cd $project_path
tmux -u new-session -d -s $name


tmux new-window -t $1:1 -n Server 
tmux new-window -t $1:2 -n Vim
tmux new-window -t $1:3 -n ZSH

tmux send-keys -t $name:1 "tmux rename-window -t 1 ' '" C-m
tmux send-keys -t $name:1 "source env/bin/activate"

tmux send-keys -t $name:2 "tmux rename-window -t 2 ' '" "C-m"
tmux send-keys -t $name:2 "vim" C-m

tmux send-keys -t $name:3 "tmux rename-window -t 3 ' '" "C-m"
