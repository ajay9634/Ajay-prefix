#!/bin/bash

# Remove the previous file
rm -f ~/x

# Install termux-am silently
echo "Installing termux-am..."
pkg install termux-am -y &>/dev/null

# Setup storage and wait for permissions
termux-setup-storage & sleep 4 &>/dev/null

# Check for storage permission loop
while true; do
    if [ -d ~/storage/shared ]; then
        break
    else
        echo "Storage permission denied"
    fi
    sleep 3
done

echo "Storage permission granted."
