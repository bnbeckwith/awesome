#!/bin/bash

rss=`wget -q -O - http://www.nasa.gov/rss/lg_image_of_the_day.rss`

img_url=`echo $rss | grep -o '<enclosure [^>]*>' | grep -o 'http://[^\"]*'`

img_name=`echo $img_url | grep -o [^/]*\.\w*$`

mkdir -p /tmp/.backgrounds

wget -q -O /tmp/.backgrounds/$img_name $img_url

feh --bg-fill /tmp/.backgrounds/$img_name
