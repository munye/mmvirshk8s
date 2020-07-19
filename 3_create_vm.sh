IGNITION_CONFIG="$PWD/var/conf/mycroserver.ign"
IMAGE=$(ls -1tr $PWD/var/lib/libvirt/images/*qcow2| tail -1)

#
# Create Master of puppets (are calling your name)
#
VM_NAME="fcos-master"
RAM_MB="2048"
DISK_GB="10"
virt-install --connect qemu:///session -n "${VM_NAME}" -r "${RAM_MB}" --os-variant=fedora32 \
	--quiet \
        --import --graphics=none --disk "pool=guests,size=${DISK_GB},backing_store=${IMAGE}" \
	--network "bridge:virbr0" \
        --qemu-commandline="-fw_cfg name=opt/com.coreos/config,file=${IGNITION_CONFIG}" &

#
# Create $i no so tiny Workers
#
# N: Watch to the OS databases. A osinfo-db-20200529.tar.xz is included.
# Keep it up to date with osinfo-db-import
#
RAM_MB="2048"
DISK_GB="10"
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
