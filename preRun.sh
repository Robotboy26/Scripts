sudo apt install pip
# Set the IP address of the Apt caching server
apt_server_ip="192.168.1.65"

# Set the URL of the Devpi server
devpi_server_url="http://localhost:3141"

# Configure Apt to use the Apt caching server
sudo echo "Acquire::http::Proxy \"http://$apt_server_ip:3142\";" | sudo tee /etc/apt/apt.conf.d/02proxy

# Install and configure Devpi client
pip install --user devpi-client

# Set the full path to the devpi command
devpi_path="$HOME/.local/bin/devpi"

# Authenticate with the Devpi server
"$devpi_path" login root --password='admin'

# Create a new index on the Devpi server
"$devpi_path" index -c myindex bases=root/pypi

# Set the default index to the newly created index
"$devpi_path" use "$devpi_server_url/root/myindex"

# Display the configured server IP and URL
echo "Your Apt caching server IP: $apt_server_ip"
echo "Your Devpi server URL: $devpi_server_url"

