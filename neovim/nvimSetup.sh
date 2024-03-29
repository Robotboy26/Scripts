sudo apt update
sudo apt remove nvim
rm -rf ~/.config/nvim
rm -f ~/.local/share/nvim/site/autoload/plug.vim
rm -f /usr/local/bin/nvim
rm -rf ~/.cache/nvim
rm -rf /tmp/nvim
find ~/ -name '*.swp' -type f -delete
find ~/ -name '*.un~' -type f -delete
sudo apt-get install ninja-build gettext cmake unzip curl -y
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd ..
sudo rm -r neovim
cd ~/.config
git clone https://github.com/Robotboy26/Scripts.git
sudo cp -r Scripts/neovim/nvim .
sudo chmod 0755 nvim
sudo rm -r Scripts
cd /usr/local/lib/nvim
sudo rm -r parser
sudo mkdir parser
nvim
