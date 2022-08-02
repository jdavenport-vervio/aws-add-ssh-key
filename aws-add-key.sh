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

# prompt for key
