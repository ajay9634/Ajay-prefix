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

pkg install -y tar


read -p "Enter full path of the .tar.gz file: " tarfile && \
extract_dir="$(dirname "$tarfile")" && \
tar -xzvf "$tarfile" -C "$extract_dir" && \
subfolder="$(tar -tzf "$tarfile" | head -1 | cut -d'/' -f1)" && \
[ -d "$extract_dir/$subfolder/x32" ] && mv "$extract_dir/$subfolder/x32" "$extract_dir/$subfolder/syswow64" && \
[ -d "$extract_dir/$subfolder/x64" ] && mv "$extract_dir/$subfolder/x64" "$extract_dir/$subfolder/system32" && \
dxvk_version=$(basename "$tarfile" | sed -E 's/^dxvk-([0-9.]+)\.tar\.gz$/\1/') && \
profile_json_path="$extract_dir/$subfolder/profile.json" && \

echo '{' > "$profile_json_path"
echo '  "type": "DXVK",' >> "$profile_json_path"
echo "  \"versionName\": \"$dxvk_version\"," >> "$profile_json_path"
echo '  "versionCode": 0,' >> "$profile_json_path"
echo "  \"description\": \"DXVK-$dxvk_version \"," >> "$profile_json_path"
echo '  "files": [' >> "$profile_json_path"

first_entry=true
add_entry() {
  local file_path="$1"
  local target_path="$2"
  if [ -f "$file_path" ]; then
    if [ "$first_entry" = false ]; then
      echo ',' >> "$profile_json_path"
    fi
    echo "    {" >> "$profile_json_path"
    echo "      \"source\": \"$target_path\"," >> "$profile_json_path"
    echo "      \"target\": \"\${${target_path%/*}}/${target_path##*/}\"" >> "$profile_json_path"
    echo -n "    }" >> "$profile_json_path"
    first_entry=false
  fi
}

# Check system32 DLLs
for dll in d3d9 d3d10 d3d10_1 d3d10core d3d11 dxgi; do
  add_entry "$extract_dir/$subfolder/system32/$dll.dll" "system32/$dll.dll"
done

# Check syswow64 DLLs
for dll in d3d8 d3d9 d3d10 d3d10_1 d3d10core d3d11 dxgi; do
  add_entry "$extract_dir/$subfolder/syswow64/$dll.dll" "syswow64/$dll.dll"
done

echo '' >> "$profile_json_path"
echo '  ]' >> "$profile_json_path"
echo '}' >> "$profile_json_path"

tar --zstd -cvf "${tarfile%.tar.gz}.tzst" -C "$extract_dir/$subfolder" . && \
rm -rf "$extract_dir/$subfolder"