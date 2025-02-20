#!/bin/bash

# Remove the previous file
rm -f testing.sh

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

pkg update -y
pkg install -y tar

read -p "Enter full path of the .tar.gz file: " tarfile && \
extract_dir="$(dirname "$tarfile")" && \
tar -xzvf "$tarfile" -C "$extract_dir" && \
subfolder="$(tar -tzf "$tarfile" | head -1 | cut -d'/' -f1)" && \
[ -d "$extract_dir/$subfolder/x32" ] && mv "$extract_dir/$subfolder/x32" "$extract_dir/$subfolder/syswow64" && \
[ -d "$extract_dir/$subfolder/x64" ] && mv "$extract_dir/$subfolder/x64" "$extract_dir/$subfolder/system32" && \
tar --zstd -cvf "${tarfile%.tar.gz}.tar.zst" -C "$extract_dir/$subfolder" . && \
rm -rf "$extract_dir/$subfolder"
