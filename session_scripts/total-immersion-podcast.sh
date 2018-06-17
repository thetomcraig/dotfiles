export EVENT_NOKQUEUE=1

name=$2
root=$1
path=$root/$2

xml_url="https://raw.githubusercontent.com/thetomcraig/total-immersion-podcast/master/xml_stuff/itunes.xml"
podtrac_url="http://publisher.podtrac.com/dashboard/byT0zgJ3o_Jv"
s3_url="https://console.aws.amazon.com/s3/buckets/total-immersion-podcast/?region=us-west-2&tab=overview#"
validator_url="http://castfeedvalidator.com/"
stitcher_url="https://partners.stitcher.com/dashboard.php"
itunes_url="https://podcastsconnect.apple.com/my-podcasts"
soundcloud_url="https://soundcloud.com/upload"
web_pages=(
  xml_url,
  podtrac_url,
  s3_url,
  validator_url,
  stitcher_url,
  itunes_url,
  soundcloud_url,
)

cd $path
tmux -u new-session -d -s $name

tmux new-window -t $name:1 -n Text

count=0
while [ "x${web_pages[count]}" != "x" ]
do
  open ${projects[$count]}
  count=$(( $count + 1 ))
done

tmux send-keys -t $name:1 "cd $path" C-m C-m
tmux send-keys -t $name:1 "vim" C-m C-m
