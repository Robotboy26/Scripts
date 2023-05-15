sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl gpg
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install -y code
pactl set-sink-mute 0 1
echo "set-sink-mute 0 1" | sudo tee -a /etc/pulse/default.pa
sudo apt remove bluez -y
sudo apt install ufw tlp preload python3-pip -y
sudo apt autoremove -y
sudo apt update -y
sudo ufw enable
sudo tlp start
cd Downloads
mkdir git
wget https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/CGHRL.sh
wget https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/DAGHR.sh
wget https://raw.githubusercontent.com/Robotboy26/Scripts/main/github/wanted.txt
#wget https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-desktop-amd64.iso?_ga=2.175045409.245219162.1683942175-600468238.1683942175
#wget https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-live-amd64.iso
wget https://raw.githubusercontent.com/Robotboy26/Scripts/main/requirements.txt
sudo apt install meson # this is needed for d-bus python
pip install -r requirements.txt
rm requirements.txt

