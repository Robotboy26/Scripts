cd
sudo apt update -y
curl -fsS https://dlang.org/install.sh | bash -s dmd
source ~/dlang/dmd-2.105.0/activate
sudo apt install build-essential
sudo apt install libcurl4-openssl-dev libsqlite3-dev pkg-config git curl
curl -fsS https://dlang.org/install.sh | bash -s dmd
sudo apt install libnotify-dev
git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure
make clean; make;
sudo make install
cd ..
git clone https://github.com/bpozdena/OneDriveGUI.git
cd OneDriveGUI/src
python3 OneDriveGUI.py
