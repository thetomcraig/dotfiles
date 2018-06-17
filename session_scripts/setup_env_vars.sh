case $1 in
total-immersion-podcast)
  alias post=open_tabs_for_posting
  open_tabs_for_posting() {
    xml_url="https://raw.githubusercontent.com/thetomcraig/total-immersion-podcast/master/xml_stuff/itunes.xml"
    podtrac_url="http://publisher.podtrac.com/dashboard/byT0zgJ3o_Jv"
    s3_url="https://console.aws.amazon.com/s3/buckets/total-immersion-podcast/?region=us-west-2&tab=overview#"
    validator_url="http://castfeedvalidator.com/"
    stitcher_url="https://partners.stitcher.com/dashboard.php"
    itunes_url="https://podcastsconnect.apple.com/my-podcasts"
    soundcloud_url="https://soundcloud.com/upload"
    declare -a web_pages=(
      $xml_url
      $podtrac_url
      $s3_url
      $validator_url
      $stitcher_url
      $itunes_url
      $soundcloud_url
    )
    for i in "${web_pages[@]}"
    do
      open $i
    done
  }
  echo "TOTAL IMMERSION ENGAGED"
  ;;
*)
  Message="I seem to be running with an nonexistent amount of disk space..."
  ;;
esac

