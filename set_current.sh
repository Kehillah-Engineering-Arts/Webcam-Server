#!/bin/bash

# This looks at the /boot/config.txt file to see
# if the raspberry pi has been configured to output
# enough current to power an external hard drive.


grep "max_usb_current=1" /boot/config.txt
if [ $? -eq 1 ] # ? will be 1 if grep found nothing
then
  #append to the file
  echo "~~> updating /boot/config.txt"
  echo "max_usb_current=1" >> /boot/config.txt
  sudo reboot
else
  echo "~~> current properly configured, skipping..."
fi
