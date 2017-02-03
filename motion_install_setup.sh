# Must be run as root or with sudo

SUDO=''
if [ "$EUID" -ne 0 ]
    while true; do
        read -p "You are not root. Do you want to try with sudo? (y/n) " yn
        case $yn in
            [Yy]* ) SUDO='sudo'; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi
