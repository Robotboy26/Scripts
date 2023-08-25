# Install apt-cacher-ng
sudo apt-get update
sudo apt-get install -y apt-cacher-ng

# Configure apt-cacher-ng to cache APT packages
sudo sed -i 's/# PassThroughPattern: .*/PassThroughPattern: .*/' /etc/apt-cacher-ng/acng.conf

# Configure apt to use apt-cacher-ng as a proxy
apt_proxy_conf="/etc/apt/apt.conf.d/01proxy"
echo "Acquire::http::Proxy \"http://localhost:3142\";" | sudo tee $apt_proxy_conf
echo "Acquire::https::Proxy \"false\";" | sudo tee -a $apt_proxy_conf

# Restart apt-cacher-ng service
sudo systemctl restart apt-cacher-ng

# Display the instructions to configure the client
echo "Your apt-cacher-ng server is ready."
echo "To configure your client:"
echo "  1. Open the apt configuration file: sudo nano /etc/apt/apt.conf.d/01proxy"
echo "  2. Replace 'localhost' with the IP address of the server running apt-cacher-ng."
echo "  3. Save the file and exit."
echo "You can now use apt-get commands to install packages, and they will be cached by apt-cacher-ng."
