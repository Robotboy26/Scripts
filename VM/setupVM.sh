# Download the Ubuntu and Kali ISO
declare -A files=(
    ["ubuntu22.iso"]="https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-desktop-amd64.iso?_ga=2.175045409.245219162.1683942175-600468238.1683942175"
    ["kali.iso"]="https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-live-amd64.iso"
)

for file in "ubuntu22.iso" "kali.iso"; do
    echo "Checking $file"
    if [ -f "$file" ]; then
        echo "File exists, skipping..."
    else
        echo "File does not exist, downloading..."
        wget -O "$file" "${files[$file]}"
    fi
done