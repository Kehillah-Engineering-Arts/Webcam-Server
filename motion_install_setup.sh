#!/bin/bash
# Must be run as superuser to perform installation

bold=$(tput bold)
nor=$(tput sgr0)
und=$(tput smul)
title="${bold}${und}Kehillah Engineering Arts Motion Installer and Configurer${nor}" 

sudomaker()
{
SUDO=''
# if statement checks if user ran as root
if [ "$EUID" -ne 0 ] ; then
    # while block asks user if they want to continue not as root
    while true; do
        echo "You are not superuser. Cannot be performed if you try without proper privileges."
        read -p "Do you wish to enable sudo? (y/n) " yn
        case $yn in
            [Yy]* ) SUDO='sudo'; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi
}

while [ "$1" != "" ]; do
    case $1 in 
        -h | --help )
        echo
        printf "%*s\n" $(((${#title}+$(tput cols))/3)) "$title"
        echo
        echo "1. This script attempts to install Motion from https://motion-project.github.io"
        echo "2. Motion ${bold}must${nor} be installed as superuser, so this should be run as superuser."
        echo "3. If the program is ${bold}not${nor} run as superuser, it will ask if you want to use sudo"
        echo "   to prevent failed motion installations."
        echo "4. If you are wary of running the script as superuser, you ought to read the"
        echo "   code, as everything is simple to understand and comments are frequent."
        echo
        echo "-h, --help                    View help page"
        echo "-i, --install                 Installs the program"
        echo "-c, --copy                    Copy motion.conf to destination (must run as superuser)"
        echo "-m, --mount                   Mount to /mnt/security. Must be ext3 and in /dev/sda1"
        exit;;


        -i | --install )
        sudomaker
        # check sudo privileges 
        $SUDO -v
        # install and copy over motion.conf
        $SUDO apt-get install motion
        exit;;

        -c | --copy )
        sudomaker
        $SUDO mv motion.conf /etc/motion/
        exit;;

        -m | --mount )
        sudomaker
        if [-d "/dev/sda1" ]; then
            $SUDO mkdir /mnt/security
            $SUDO mount -t ext3 /dev/sda1 /mnt/security
            $SUDO mkdir /mnt/security/videos
        else
            echo "No drive in /dev/sda1."
        fi
        # must be sda1 and must be ext3
        exit;;

        * )
        printf "%*s\n" $(((${#title}+$(tput cols))/3)) "$title"
        echo "Invalid flag. Run with -h flag for instructions."
        exit;;
    esac
done
printf "%*s\n" $(((${#title}+$(tput cols))/3)) "$title"
echo "Run with -h flag for instructions."
