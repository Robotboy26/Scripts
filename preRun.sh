sudo apt install pip
# Set the IP address of the Apt caching server
apt_server_ip="192.168.1.65"
# Configure Apt to use the Apt caching server
sudo echo "Acquire::http::Proxy \"http://$apt_server_ip:3142\";" | sudo tee /etc/apt/apt.conf.d/02proxy

# Display the configured server IP and URL
echo "Your Apt caching server IP: $apt_server_ip"

