declare -A projects=(['1']=slingshot
                     ['2']=produktizr
                     ['3']=pandoraads
                     ['4']=dotfiles
                     ['5']=xenomorph
                     ['6']=heron
                     ['7']=total-immersion-pocast
                     ['8']=tipcast)

echo "What would you like to work on?"
echo "1: Slingshot
2: Produktizr
3: Pandoraads
4: Dotfiles
5: Xenomorph
6: HERON
7: Total Immersion Backend
8: Total Immersion Files"
read choice


project_path="~/Dropbox/TomCraig/Projects"
host=$(uname -a)
if [[ $host == *"tcraig"* ]]; then
    project_path="~/dev"
elif [[ $host == *"ZENO"* ]]; then
    project_path="~"
elif [[ $host == *"HERMES"* ]]; then
    project_path="~"
fi

name=${projects[$choice]}

~/Dotfiles/session_scripts/$name.sh $project_path $name && tmux attach -t $name
