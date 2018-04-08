declare -A projects=(['1']=slingshot
                     ['2']=produktizr
                     ['3']=produktizr-front-end
                     ['4']=produktizr-back-end
                     ['5']=dotfiles
                     ['6']=xenomorph
                     ['7']=heron
                     ['8']=total-immersion-pocast
                     ['9']=tipcast)

echo "What would you like to work on?"
echo "1: Slingshot
2: Produktizr
3: Produktizr Front End
4: Produktizr Back End
5: Dotfiles
6: Xenomorph
7: HERON
8: Total Immersion Backend
9: Total Immersion Files"
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
