sudo apt update -y
sudo apt upgrade -y
sudo apt install git neovim htop btop ufw net-tools -y # startup utils
sudo ufw enable # start the firewall
sudo ufw allow 22 # for ssh

# setup openssh
sudo apt install openssh-client openssh-server
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.original # make a backup of the file
sudo chmod a-w /etc/ssh/sshd_config.original # protect it from writing
sudo service ssh start

# shell in a box (not yet working)
sudo apt install shellinabox
sudo systemctl start shellinabox
sudo systemctl enable shellinabox
sudo sed -i '5s/4200/6565/' /etc/default/shellinabox # change the port
sudo systemctl restart shellinabox
sudo ufw allow 6565 # open port
# shell in a box is now started on port 6565 (you might want to find a better port)
# you might want to find a way to make is require an aditional password

# install docker
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
apt-cache policy docker-ce -y
sudo apt install docker-ce -y
sudo systemctl status docker

# jellyfin
# compile from source
git clone https://github.com/jellyfin/jellyfin.git
cd jellyfin
git submodule update --init
sudo docker build -t robotserver/jellyfin .
sudo docker run -d -p 8096:8096 robotserver/jellyfin
sudo ./build -t docker -p ubuntu.amd64 

# samba

sudo apt update -y
sudo apt install samba -y
sudo smbpasswd -a samba
sudo smbpasswd -a samba
sudo adduser samba
sudo setfacl -R -m "u:samba:rwx" /home/external

# nextcloud
# setup
sudo apt update && sudo apt upgrade -y
sudo apt install apache2 mariadb-server libapache2-mod-php php-gd php-mysql php-curl php-mbstring php-intl php-gmp php-bcmath php-xml php-imagick php-zip -y
