#!/bin/bash
# Must be run as root or with sudo to perform installation

bold=$(tput bold)
nor=$(tput sgr0)
und=$(tput smul)

while [ "$1" != "" ]; do
    case $1 in 
        -h | --help )
        echo
        title="${bold}${und}Kehillah Engineering Arts Motion Installer and Configurer${nor}" 
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
        exit;;


        -i | --install )
        SUDO=''
        # if statement checks if user ran as root
        if [ "$EUID" -ne 0 ] ; then
            # while block asks user if they want to continue not as root
            while true; do
                echo "You are not superuser. Install cannot be performed if you try without proper privileges."
                read -p "Do you wish to enable sudo to install Motion? (y/n) " yn
                case $yn in
                    [Yy]* ) SUDO='sudo'; break;;
                    [Nn]* ) exit;;
                    * ) echo "Please answer yes or no.";;
                esac
            done
        # if user is root, asks if they want to continue as root
        else
            while true; do
                read -p "Are you sure you want to install Motion? (y/n) " yn
                case $yn in
                    [Yy]* ) break;;
                    [Nn]* ) exit;;
                    * ) echo "Please answer yes or no.";;
                esac
            done
        fi
        # check sudo privileges 
            $SUDO -v

        $SUDO apt-get install motion

        exit;;

        * )
        exit;;
    esac
done

