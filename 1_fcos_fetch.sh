STREAM="stable"
coreos-installer download -s "${STREAM}" -p qemu -f qcow2.xz --decompress -C ./var/lib/libvirt/images/
