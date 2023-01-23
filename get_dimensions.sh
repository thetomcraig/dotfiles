input=$(echo $@ | tr " " "/")

IFS=$'\n'

array=($(for j in `mediainfo $@ | grep "Width\|Height"`; do echo $j | awk '{printf $3}'; echo "\n"; done))

dims="${array[0]} X ${array[1]}"
echo "${dims}"
