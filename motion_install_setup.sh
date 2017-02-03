#!/bin/bash
# Must be run as root or with sudo

SUDO=''
# if statement checks if user ran as root
if [ "$EUID" -ne 0 ] ; then
    # while block asks user if they want to continue not as root
    while true; do
        read -p "You are not root user. Do you want to try with sudo? (y/n) " yn
        case $yn in
            [Yy]* ) SUDO='sudo'; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
# if user is root, asks if they want to continue as root
else
    while true; do
        read -p "You are root user. Do you want to continue as root? (y/n) " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi
# if user is not root, checks if they are not 
if [ $SUDO == 'sudo' ] ; then
    $SUDO -v
else
    echo You are root user.
fi