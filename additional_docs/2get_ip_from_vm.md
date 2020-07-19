declare -a IPS
for i in $(virsh list --all | grep fcos | awk '{print $2}')
do
  ARP=$(arp -an | grep $(virsh dumpxml $i | grep 'mac address' | awk -F"'" '{print $2}'))
  IP=$(echo "$ARP" | sed '/\n/!s/[0-9.]\+/\n&\n/;/^\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\n/P;D')
  IPS=( "${IPS[@]}" "$IP" )
done
echo $IPS
