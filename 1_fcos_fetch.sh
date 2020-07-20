mkdir -p ./var/lib/libvirt/images
mkdir -p ./var/lib/libvirt/source
#STREAM="stable"
STREAM="testing"
coreos-installer download -s "${STREAM}" -p qemu -f qcow2.xz --decompress -C ./var/lib/libvirt/images/
