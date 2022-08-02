#!/bin/bash

echo "================== AWS ADD KEY =================="
echo "                 Vervio Digital"
echo ""

# make sure user isn't running as root
if [[ $(whoami) == "root" ]]; then
    echo "DO NOT RUN THIS SCRIPT AS ROOT!"
    echo "Running as root will result in your SSH key being added incorrectly!"
    echo ""
    echo "Remove the 'sudo' from the command, or press Ctrl+D to exit your root shell if you created one"
    exit 1
fi

# ask user to get public key
echo "Please run the following command on your local terminal to get your SSH key:"
echo ""
echo " $ cat ~/.ssh/id_rsa.pub"
echo ""
echo "(if your key is in a different file read the appropriate one, make sure it's the .pub file)"
read -p "Press Enter to continue..."

# read public key
echo ""
echo "Please paste your public key into the following prompt."
echo " (e.g. ssh-rsa AAAAB3NzaC.....DrTmjz3D username@hostname)"
echo ""
read -p "Enter your public key: " PUBLIC_KEY

# add the SSH key to the key file
echo "Adding your public key..."
mkdir -p ~/.ssh && chmod go-rwx ~/.ssh
echo $PUBLIC_KEY >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

echo ""
echo "Done!"

# print ssh login info
USER=$(whoami)
IP=$(hostname -I)
echo ""
echo "Your SSH key has been added! Please use the following credentials to log in:"
echo ""
echo " $ ssh $USER@$IP"
echo ""

exit 0