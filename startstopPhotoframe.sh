#!/bin/bash

ROOT='/mnt/us/photoframe/'
photoframerunning=1

# check if the photoframe 'app' is not running (by checking if the photoframeactive file is there) 
test -f $ROOT'photoframeactive' || photoframerunning=0

if [ $photoframerunning -eq 0 ]; then

	/etc/init.d/powerd stop
	/etc/init.d/framework stop
	
	eips -c  # clear display
	echo "Photo Frame is not running. Lets start it"
	# eips "Photo Frame is not running. Lets start it."

	# run showMetadata.sh to enable the keystrokes that will show the metadata
	# sh /mnt/us/timelit/showMetadata.sh

	touch $ROOT'photoframeactive'
	echo 0 > $ROOT'photoframeactive'
	sh $ROOT'runPhotoframe.sh'

else

	rm $ROOT'photoframeactive'

	eips -c  # clear display
	echo "Photo Frame is running. Make it stop."
	# eips "Photo Frame is running. Make it stop."

	# go to home screen
	# echo "send 102">/proc/keypad

	/etc/init.d/framework start
	/etc/init.d/powerd start

fi
