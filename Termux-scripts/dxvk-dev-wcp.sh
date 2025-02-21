#!/data/data/com.termux/files/usr/bin/bash

rm -f dxvk-dev-wcp.sh &>/dev/null

# Install termux-am silently
echo "Please wait ..."
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

pkg install -y tar &>/dev/null
pkg install -y zstd &>/dev/null

read -p "Enter full path of the .zip file: " zipfile
read -p "Enter DXVK version: " dxvk_version
read -p "Enter version code (numeric value): " version_code

# Define extraction directory
extract_dir="$(dirname "$zipfile")"
unzip_dir="${extract_dir}/$(basename "$zipfile" .zip)"

# Extract ZIP directly
mkdir -p "$unzip_dir"
unzip -q "$zipfile" -d "$unzip_dir"

# Rename folders if they exist
[ -d "$unzip_dir/x32" ] && mv "$unzip_dir/x32" "$unzip_dir/syswow64"
[ -d "$unzip_dir/x64" ] && mv "$unzip_dir/x64" "$unzip_dir/system32"

# Create profile.json
profile_json_path="$unzip_dir/profile.json"

echo '{' > "$profile_json_path"
echo '  "type": "DXVK",' >> "$profile_json_path"
echo "  \"versionName\": \"$dxvk_version\"," >> "$profile_json_path"
echo "  \"versionCode\": $version_code," >> "$profile_json_path"
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
  add_entry "$unzip_dir/system32/$dll.dll" "system32/$dll.dll"
done

# Check syswow64 DLLs
for dll in d3d8 d3d9 d3d10 d3d10_1 d3d10core d3d11 dxgi; do
  add_entry "$unzip_dir/syswow64/$dll.dll" "syswow64/$dll.dll"
done

echo '' >> "$profile_json_path"
echo '  ]' >> "$profile_json_path"
echo '}' >> "$profile_json_path"

# Define output file name
output_file="dxvk-${dxvk_version}-${version_code}.wcp"

# Create .wcp archive, excluding .sh and .tar.gz files
tar --zstd --exclude='*.sh' --exclude='*.tar.gz' -cvf "$extract_dir/$output_file" -C "$unzip_dir" . && \
rm -rf "$unzip_dir"

echo "Conversion complete: $output_file"
