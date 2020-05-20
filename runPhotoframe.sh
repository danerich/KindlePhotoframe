#!/bin/sh

ROOT='/mnt/us/photoframe/'

# If the Kindle is not being used as photoframe, then just quit
test -f $ROOT'photoframeactive' || exit

# Get current image number
CurrentPhotoNumber=$(cat $ROOT'photoframeactive') 

# Get the number of images in the images folder
NumberOfImages=$(cat $ROOT'numberofimages') 

# Get a random number
RanNum=`awk -v  min=0 -v max=$NumberOfImages 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`

# Check if its the active image
if [ $RanNum -eq $CurrentPhotoNumber ]; then
  # Run again and quit so we get a different image
	sh $ROOT'runPhotoframe.sh'
	exit
fi

ThisImage=$ROOT"images/$RanNum.png"

echo $RanNum > $ROOT'photoframeactive'

# Clear the screen
eips -c

# Show that image
eips -g $ThisImage