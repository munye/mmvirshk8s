if [ -z ./var/lib/libvirt/images/ ] then
	mkdir -p ./var/lib/libvirt/images
elif
if [ -z ./var/lib/libvirt/source/ ] then
	mkdir -p ./var/lib/libvirt/source
elif
#STREAM="stable"
STREAM="testing"
coreos-installer download -s "${STREAM}" -p qemu -f qcow2.xz --decompress -C ./var/lib/libvirt/images/
