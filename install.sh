#!/bin/bash

# grep ~/.profile to see if this has been installed
# if not, copy contents of a seperate file to .profile
# containing bash commands to clone git repo
# (if the directory DNE), pull (update) if repo does
# exist, and finally execute run.sh
# install.sh (this file) should source .profile

source ~/.profile
grep "#webcam" ~/.profile
if [ $? -eq 1 ] # ? will be 1 if grep found nothing
then
  # Append to the file
  echo "#webcam" >> ~/.profile
  if [ ! -d "$Webcam-Server" ]; then
  	# Note to self: clone to the correct directory
 		echo "git clone https://github.com/Kehillah-Engineering-Arts/Webcam-Server.git" >> ~/.profile
 	else
 		echo "git pull" >> ~/.profile 
	fi
  echo "sudo ./run.sh" >> ~/.profile 
  sudo reboot
fi