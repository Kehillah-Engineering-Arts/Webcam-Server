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

  # Set up cronjob
  crontab -l > mycron
  echo "0 0 * * * /home/pi/Webcam-Server/transfer.py" >> mycron
  crontab mycron
  rm mycron
  
  # These three lines are for freeing up space on the raspberry pi. They remove unnecessary files and clear up roughly 1.6 Gb of space on the drive:
  # sudo cp /etc/network/interfaces /etc/network/interfaces.bak
  # wget https://gist.githubusercontent.com/samatjain/4dda24e14a5b73481e2a/raw/5d9bac8ec40b94833b4e9938121945be252fdee1/Slim-Raspbian.sh -O Slim-Raspbian.sh
  # sh ./Slim-Raspbian.sh | sudo sh

  sudo reboot
fi
