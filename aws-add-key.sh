#!/bin/bash

# ------------------------------------ Utilities ------------------------------------

# add print function capable of printing colour codes
print() {
    echo -e $*
}

# colours
# source: https://stackoverflow.com/a/28938235
Color_Off='\033[0m'
On_Cyan='\033[46m'
Yellow='\033[0;33m'
UGreen='\033[4;32m'
IRed='\033[0;91m'
IGreen='\033[0;92m'

# ------------------------------------ Start script ------------------------------------

clear
print "$On_Cyan================== AWS ADD KEY =================="
print "$On_Cyan|----------------Vervio Digital-----------------|"
print "$Color_Off"

# make sure user isn't running as root
if [[ $(whoami) == "root" ]]; then
    print "${IRed}DO NOT RUN THIS SCRIPT AS ROOT!"
    print "Running as root will result in your SSH key being added incorrectly!"
    print ""
    print "Remove the 'sudo' from the command, or press Ctrl+D to exit your root shell if you created one"
    exit 1
fi

# ask user to get public key
print "${UGreen}Please run the following command on your local terminal to get your SSH key:"
print ""
print "$Yellow $ cat ~/.ssh/id_rsa.pub $Color_Off"
print ""
print "(if your key is in a different file read the appropriate one, make sure it's the .pub file)"
read -p "Press Enter to continue..."

# read public key
print ""
print "${UGreen}Please paste your public key into the following prompt.$Color_Off"
print " (e.g. ssh-rsa AAAAB3NzaC.....DrTmjz3D username@hostname)"
print ""
read -p "Enter your public key: " PUBLIC_KEY

# add the SSH key to the key file
print "Adding your public key..."
mkdir -p ~/.ssh && chmod go-rwx ~/.ssh
print $PUBLIC_KEY >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

print ""
print "${IGreen}Done!"

# print ssh login info
USER=$(whoami)
IP=$(hostname -I)
print ""
print "${Green}Your SSH key has been added! Please use the following credentials to log in:"
print ""
print "${Yellow} $ ssh $USER@$IP"
print "$Color_Off"

exit 0