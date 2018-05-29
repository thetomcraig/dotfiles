declare -A projects=(['1']=slingshot
                     ['2']=produktizr
                     ['3']=pandoraads
                     ['4']=pandora-harmony
                     ['5']=create-pandora-react-app
                     ['6']=dotfiles
                     ['7']=xenomorph
                     ['8']=heron
                     ['9']=total-immersion-podcast
                     ['q']=tipcast)

echo "What would you like to work on?"
echo "1: Slingshot
2: Produktizr
3: Pandoraads
4: Harmony
5: Pandora Create React App
6: Dotfiles
7: Xenomorph
8: HERON
9: Total Immersion Backend
q: Total Immersion Files"
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
