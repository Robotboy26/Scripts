# Download the latest Ubuntu ISO
if [ -f /home/robot/Desktop/ubuntu22.iso ]; then
    echo "File exists"
else
    echo "File does not exist"
    wget ubuntu22.iso https://releases.ubuntu.com/22.04.2/ubuntu-22.04.2-desktop-amd64.iso?_ga=2.175045409.245219162.1683942175-600468238.1683942175
fi

sudo apt-get update
sudo apt-get install -y qemu-kvm qemu virt-manager virt-viewer libvirt-daemon libvirt-clients bridge-utils

qemu-img create -f qcow2 ubuntu_disk.qcow2 20G
qemu-system-x86_64 -m 12256 -boot d -cdrom ubuntu22.iso -drive file=ubuntu_disk.qcow2,format=qcow2 -enable-kvm
