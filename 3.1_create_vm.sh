IGNITION_CONFIG="$PWD/var/conf/mycroserver.ign"
IMAGE="$PWD/var/lib/libvirt/images/fedora-coreos-32.20200629.3.0-qemu.x86_64.qcow2"
DISK_GB="10"

# Create Master of puppets (are calling your name)
VM_NAME="fcos-master"
RAM_MB="1024"
virt-install --connect qemu:///session -n "${VM_NAME}" -r "${RAM_MB}" --os-variant=fedora32 \
	--quiet \
        --import --graphics=none --disk "pool=guests,size=${DISK_GB},backing_store=${IMAGE}" \
	--network "bridge:virbr0" \
        --qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${IGNITION_CONFIG}" &

# Create no so lefties Workers
RAM_MB="2048"
for i in {1..2}
do
VM_NAME="fcos-worker-$i"
echo "Creando: "$VM_NAME
virt-install --connect qemu:///session -n "${VM_NAME}" -r "${RAM_MB}" --os-variant=fedora32 \
	--quiet \
        --import --graphics=none --disk "pool=guests,size=${DISK_GB},backing_store=${IMAGE}" \
	--network "bridge:virbr0" \
        --qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${IGNITION_CONFIG}" &
done
