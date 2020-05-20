# Kindle Photo Frame.

I have had my old Kindle with a keyboard in a draw for some time. I always thought it would be nice to reuse the e-paper screen for something like a photo frame. Granted the screen is low res and grayscale but still, I thought it would be nice to have a new image to look at every day.

Based on the [Literary Clock](https://www.instructables.com/id/Literary-Clock-Made-From-E-reader/) and the [Kindle Weather Display](https://mpetroff.net/2012/09/kindle-weather-display/).

## Jailbreaking

I had already done this so I could use my pictures as a screensaver.
https://www.mobileread.com/forums/showthread.php?t=88004

Useful page with a list of all serial numbers to model numbers:
https://wiki.mobileread.com/wiki/KindleSerialNumbers

## usbNetwork
So you can access the shell over SSH over USB you can also set this up so you can [access SSH over Wifi](https://www.turnkeylinux.org/blog/kindle-root)

Turning on usbNetwork press the `DEL` key to bring up the search box then type in the two searches
```
;debugOn
~usbNetwork
```

## Installation

Add photoframe directory to `/mnt/us/` (the files you see when connected in USB drive mode)

Inside this directory include:
```
├── images
│ ├── 0.png
│ └── 1.png
├── numberofimages
├── runPhotoframe.sh
└── startstopPhotoframe.sh
```

You don't need to include the `photoframeactive` file this is used by the script to tell if the script is active.

Add images into the images directory and update the total in the `numberofimages` file.

### Crontab 

Edit the crontab
```
nano /etc/crontab/root
```
Set to run everyday at midnight
```
0 0 * * * /mnt/us/photoframe/runPhotoframe.sh
```
Refresh the crond
```
/etc/init.d/cron restart
```

## Launchpad 

https://www.mobileread.com/forums/showthread.php?t=97636

Used to switch the script on and off with a keyboard shortcut.

Add to `/mnt/us/lanchpad/startPhotoframe.ini`:
```
[Actions]
P = !sh /mnt/us/photoframe/startstopPhotoframe.sh &
```

`Shift P` when the photo frame is not running will start the script and stop the main Kindle app and power management so the kindle will not go to sleep. Pressing `Shift P` when it is running will stop the script and restart the kindle main app.

## Images Format

Images must be saved in a grayscale colour space at 600 x 800 px. I just pick a random number to display a random image so they need to be named 0.png, 1.png

