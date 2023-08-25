# Set the IP address of the caching proxy server
proxy_server_ip="192.168.1.65"

# Configure the proxy settings for APT
apt_proxy_conf="/etc/apt/apt.conf.d/01proxy"
echo "Acquire::http::Proxy \"http://$proxy_server_ip:3128\";" | sudo tee $apt_proxy_conf
echo "Acquire::https::Proxy \"false\";" | sudo tee -a $apt_proxy_conf

# Configure the proxy settings for environment variables
export http_proxy="http://$proxy_server_ip:3128"
export https_proxy="http://$proxy_server_ip:3128"

# Configure the proxy settings for pip
pip_conf="$HOME/.pip/pip.conf"
mkdir -p "$HOME/.pip"
echo "[global]" >> $pip_conf
echo "proxy = $http_proxy" >> $pip_conf

# Configure the proxy settings for wget
wget_conf="$HOME/.wgetrc"
echo "http_proxy = $http_proxy" >> $wget_conf
echo "https_proxy = $https_proxy" >> $wget_conf

# Display the configured proxy server IP
echo "Your caching proxy server IP: $proxy_server_ip"
