if [ -z ./var/lib/libvirt/images/ ] then
	mkdir -p ./var/lib/libvirt/images
fi
if [ -z ./var/lib/libvirt/source/ ] then
	mkdir -p ./var/lib/libvirt/source
fi
#STREAM="stable"
STREAM="testing"
coreos-installer download -s "${STREAM}" -p qemu -f qcow2.xz --decompress -C ./var/lib/libvirt/images/
