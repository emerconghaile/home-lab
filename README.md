# home-lab

# create Rocky Linux cloud template for Proxmox
- (Proxmox Cloud-Init Support)[https://pve.proxmox.com/wiki/Cloud-Init_Support]
- download from https://download.rockylinux.org/pub/rocky/9/images/x86_64/
  - I chose `Rocky-9-GenericCloud.latest.x86_64.qcow2`
  - https://wiki.rockylinux.org/rocky/image/#about-cloud-images
- inject `qemu-guest-agent` into the image
  - https://austinsnerdythings.com/2021/08/30/how-to-create-a-proxmox-ubuntu-cloud-init-image/
``` bash
VM_ID=9000
wget https://download.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2
apt update && apt install libguestfs-tools -y
virt-customize -a Rocky-9-GenericCloud.latest.x86_64.qcow2 --install qemu-guest-agent
qm create $VM_ID --name rocky-9-generic-cloud-qemu-template --memory 1024 --cores 1 --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci
qm importdisk $VM_ID Rocky-9-GenericCloud.latest.x86_64.qcow2 nas-01_pve_vm_disks
qm set $VM_ID --scsi0 nas-01_pve_vm_disks:9000/vm-9000-disk-0.raw
qm set $VM_ID --ide2 nas-01_pve_vm_disks:cloudinit
qm set $VM_ID --boot order=scsi0
qm set $VM_ID --serial0 socket --vga serial0
qm template $VM_ID
```