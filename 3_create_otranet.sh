cat <<EOF > $PWD/nat225.xml 
<network>
  <name>otranet</name>
  <forward mode='nat' dev='virbr1'>
    <nat>
      <port start='1024' end='65535'/>
    </nat>
  </forward>
  <bridge name='virbr1' stp='on' delay='0'/>
  <mac address='52:54:00:f0:56:7b'/>
  <domain name='otranet'/>
  <ip address='192.168.225.1' netmask='255.255.255.0'>
    <dhcp>
      <range start='192.168.225.128' end='192.168.225.254'/>
    </dhcp>
  </ip>
</network>
EOF

sudo virsh net-define $PWD/nat225.xml
sudo virsh net-start otranet
sudo virsh net-autostart otranet
