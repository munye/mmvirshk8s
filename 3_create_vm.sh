IGNITION_CONFIG="$PWD/var/conf/mycroserver.ign"
IMAGE="$PWD/var/lib/libvirt/images/fedora-coreos-32.20200629.3.0-qemu.x86_64.qcow2"
VM_NAME="fcos-test-01"
RAM_MB="1024"
DISK_GB="10"

virt-install --connect qemu:///session -n "${VM_NAME}" -r "${RAM_MB}" --os-variant=fedora32 \
        --import --graphics=none --disk "pool=guests,size=${DISK_GB},backing_store=${IMAGE}" \
	--network "bridge:virbr0" \
        --qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${IGNITION_CONFIG}"
