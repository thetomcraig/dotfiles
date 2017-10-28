git fetch origin master
changes=$(git log master..origin/master --oneline | awk '{print $1}')
num_changes=${#changes}
if [ $num_changes -gt 0 ]
then
    echo "Dot files have been updated on remote! Would you like to pull? [y|n]:" 
    read answer
    if [ "$answer" == "y" ]
    then
        git pull
    fi
fi
