declare -A projects=(['1']=slingshot
                     ['2']=produktizr
                     ['3']=produktizr-front-end
                     ['4']=produktizr-back-end
                     ['5']=dotfiles
                     ['6']=alienblood
                     ['7']=heron
                     ['8']=total-immersion-pocast
                     ['9']=tipcast)

echo "What would you like to work on?"
echo "1: Slingshot
2: Produktizr Front End
3: Produktizr Back End
4: Dotfiles
5: Alienblood
6: HERON
7: Total Immersion Backend
8: Total Immersion Files"
read choice

name=${projects[$choice]}
~/Dotfiles/session_scripts/$name.sh $name && tmux attach -t $name

