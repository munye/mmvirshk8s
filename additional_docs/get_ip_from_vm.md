```
VM_NAME=chupala
virsh dumpxml $VM_NAME | grep 'mac address' | awk -F"'" '{print $2}
```

```
for i in $(virsh list --all | grep fcos | awk '{print $2}')
do
IP=$(arp -an | grep $(virsh dumpxml $i | grep 'mac address' | awk -F"'" '{print $2}')); echo "$i $IP"
done
```
