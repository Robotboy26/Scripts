sudo apt update -y
sudo apt upgrade -y
sudo apt remove bluez
sudo apt install ufw tlp preload
sudo ufw enable
sudo tlp start
cd Downloads
mkdir git
wget https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-desktop-amd64.iso?_ga=2.175045409.245219162.1683942175-600468238.1683942175
wget https://cdimage.kali.org/kali-2023.1/kali-linux-2023.1-live-amd64.iso
wget https://github.com/Robotboy26/Scripts/tree/main/requirements.txt
pip install -r requirements.txt
rm requirements.txt

