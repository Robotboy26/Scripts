for file in "ubuntu22.iso" "kali.iso"; do
    echo "Checking $file"
    if [ -f "$file" ]; then
        echo "File exists, skipping..."
    else
        echo "File does not exist, you need to download it (run setupVM.sh)"
    fi
done

qemu-img create -f qcow2 ubuntu_disk.qcow2 20G
qemu-system-x86_64 -m 12256 -boot d -cdrom ubuntu22.iso -drive file=ubuntu_disk.qcow2,format=qcow2 -enable-kvm
