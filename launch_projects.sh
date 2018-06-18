# Define the path to the projects directory based on physical machine
project_path="${HOME}/Dropbox/TomCraig/Projects"
session_scripts_dir="${HOME}/Dotfiles/session_scripts"

host=$(uname -a)
if [[ $host == *"tcraig"* ]]; then
    project_path="${HOME}/dev"
elif [[ $host == *"ZENO"* ]]; then
    project_path="${HOME}/Dropbox/TomCraig/Projects"
elif [[ $host == *"HERMES"* ]]; then
    project_path="${HOME}"
fi

# Declare project choices
# Ask user to work on project
declare -A projects=(['1']=slingshot
                     ['2']=produktizr
                     ['3']=pandoraads
                     ['4']=pandora-harmony
                     ['5']=create-pandora-react-app
                     ['6']=dotfiles
                     ['7']=xenomorph
                     ['8']=heron
                     ['9']=total-immersion-podcast
                     ['10']=get_template)

echo "What would you like to work on?"
echo "1: Slingshot
2: Produktizr
3: Pandoraads
4: Harmony
5: Pandora Create React App
6: Dotfiles
7: Xenomorph
8: HERON
9: Total Immersion
10: Git Template"
read choice
# Get project choice
name=${projects[$choice]}

# cd to project dir and start tmux 
path=$project_path/$name
cd $path
tmux -u new-session -d -s $name

# Setup Session windows/pane
echo "setting up, give me a second..."
sleep 3s
tmux attach -t $name
