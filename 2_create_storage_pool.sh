virsh pool-define-as guests dir - - - - "$PWD/var/lib/libvirt/storage"
virsh pool-build guests
virsh pool-start guests
virsh pool-autostart guests
