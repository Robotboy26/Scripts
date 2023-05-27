# Set the IP address of the caching server
caching_server_ip="192.168.1.65"

# Configure APT to use the caching server
apt_proxy_conf="/etc/apt/apt.conf.d/01proxy"
echo "Acquire::http::Proxy \"http://$caching_server_ip:3142\";" | sudo tee $apt_proxy_conf
echo "Acquire::https::Proxy \"false\";" | sudo tee -a $apt_proxy_conf

# Configure pip to use the caching server
pip_conf="$HOME/.pip/pip.conf"
mkdir -p "$HOME/.pip"
echo "[global]" >> $pip_conf
echo "index-url = http://$caching_server_ip:3141/root/pypi/+simple/" >> $pip_conf

# Display the configured server IP
echo "Your caching server IP: $caching_server_ip"
