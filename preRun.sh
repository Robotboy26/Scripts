sudo apt install pip
# Set the IP address of the Apt caching server
apt_server_ip="192.168.1.65"

# Set the URL of the Devpi server
devpi_server_url="http://localhost:3141"

# Configure Apt to use the Apt caching server
sudo echo "Acquire::http::Proxy \"http://$apt_server_ip:3142\";" | sudo tee /etc/apt/apt.conf.d/02proxy

# Configure the Devpi client to use the Devpi server
pip install --user devpi-client

# Set the full path to the devpi command
devpi_path="$HOME/.local/bin/devpi"

# Use the Devpi server
"$devpi_path" use "$devpi_server_url"
"$devpi_path" login root --password='admin'
"$devpi_path" index --set-cfg-attr client/index-url "$devpi_server_url/root/pypi/+simple/"

# Display the configured server IP and URL
echo "Your Apt caching server IP: $apt_server_ip"
echo "Your Devpi server URL: $devpi_server_url"

