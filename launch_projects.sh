declare -A projects=(['1']=slingshot
                     ['2']=produktizr
                     ['3']=dotfiles
                     ['4']=xenomorph
                     ['5']=heron
                     ['6']=total-immersion-pocast
                     ['7']=tipcast)

echo "What would you like to work on?"
echo "1: Slingshot
2: Produktizr
3: Dotfiles
4: Xenomorph
5: HERON
6: Total Immersion Backend
7: Total Immersion Files"
read choice


project_path="~/Dropbox/TomCraig/Projects"
host=$(uname -a)
if [[ $host == *"tcraig"* ]]; then
    project_path="~/dev"
elif [[ $host == *"ZENO"* ]]; then
    project_path="~/Dropbox/TomCraig/Projects"
else
    alias spacemacs="echo 'no spacemacs'"
fi

name=${projects[$choice]}

~/Dotfiles/session_scripts/$name.sh $project_path $name && tmux attach -t $name
