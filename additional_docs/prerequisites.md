El usuario que levante el servidor debe teneer como grupos secundarios kvm y probablemente libvirtd
```
usermod -a -G kvm elususario
usermod -a -G libvirt elususario
```
