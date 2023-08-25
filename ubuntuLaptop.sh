cd ~
sudo apt update -y
sudo apt upgrade -y
pactl set-sink-mute 0 1
echo "set-sink-mute 0 1" | sudo tee -a /etc/pulse/default.pa
sudo apt remove bluez -y
sudo apt install ufw tlp preload pip git qemu qemu-system-x86 steam nasm xterm python3-venv python3-dotenv ark btop -y
sudo apt autoremove -y
sudo apt update -y
sudo ufw enable
sudo tlp start
sudo systemctl enable tlp.service
cd Downloads

declare -A files=(
    ["ubuntu22.iso"]="https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-desktop-amd64.iso?_ga=2.175045409.245219162.1683942175-600468238.1683942175"
    ["kali.iso"]="https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-live-amd64.iso"
    ["setupVM.sh"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/VM/setupVM.sh"
    ["createVM.sh"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/VM/createVM.sh"
    ["runVM.sh"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/VM/runVM.sh"
    ["CGHRL.sh"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/CGHRL.sh"
    ["DAGHR.sh"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/DAGHR.sh"
    ["wanted.txt"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/wanted.txt"
    ["requirements.txt"]="https://raw.githubusercontent.com/Robotboy26/Scripts/main/requirements.txt"
)

mkdir -p VM
cd VM

for file in "setupVM.sh" "createVM.sh" "runVM.sh"; do
    echo "Checking $file"
    if [ -f "$file" ]; then
        echo "File exists, skipping..."
    else
        echo "File does not exist, downloading..."
        wget -O "$file" "https://raw.githubusercontent.com/Robotboy26/Scripts/main/VM/$file"
        sudo chmod u+x "$file"
    fi
done

cd ..

mkdir -p git
cd git

for file in "CGHRL.sh" "DAGHR.sh" "wanted.txt" "requirements.txt"; do
    echo "Checking $file"
    if [ -f "$file" ]; then
        echo "File exists, skipping..."
    else
        echo "File does not exist, downloading..."
        wget -O "$file" "https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/$file"
        sudo chmod u+x "$file"
    fi
done

# this is for vscode stuff
# Check if the PATH variable already contains the necessary directories
if [[ ":$PATH:" == *":/usr/bin:"* && ":$PATH:" == *":/bin:"* ]]; then
  echo "PATH already includes /usr/bin and /bin"
else
  # Append /usr/bin and /bin to the PATH variable
  echo 'export PATH="/usr/bin:/bin:$PATH"' >> ~/.bashrc  # Modify this line if using a different shell configuration file

  # Reload the shell configuration file
  source ~/.bashrc  # Modify this line if using a different shell configuration file

  echo "PATH updated to include /usr/bin and /bin"
fi

sudo apt install meson -y # this is needed for d-bus python ; in might not be needed
python3 -m pip install -r requirements.txt
rm requirements.txt
steam
