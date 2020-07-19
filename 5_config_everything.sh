ip_2_env() {
for i in $(virsh list --all | grep fcos | awk '{print $2}')
do
  ARP=$(arp -an | grep $(virsh dumpxml $i | grep 'mac address' | awk -F"'" '{print $2}'))
  IP=$(echo "$ARP" | sed '/\n/!s/[0-9.]\+/\n&\n/;/^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\n/P;D')
  IPS=( "${IPS[@]}" "$IP" )
done
echo $IPS
}

unset IPS
declare -a IPS
ip_2_env
KUBESPRAY_HOME=$PWD/kubespray/
cp -rfp $KUBESPRAY_HOME/inventory/sample $KUBESPRAY_HOME/inventory/mycluster
CONFIG_FILE=$KUBESPRAY_HOME/inventory/mycluster/hosts.yaml 
python3 $KUBESPRAY_HOME/contrib/inventory_builder/inventory.py ${IPS[@]} 
