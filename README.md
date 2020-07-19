## Prerequisitos
- El usuario debe estar en los grupos kvm y libvirt
- **The user must be in kvm and libvirt groups**

```bash
usermod -a -G kvm elususario
usermod -a -G libvirt elususario
```

- fcos utiliza Ignition para el setup de firstboot. 
Para transpilar un yaml al json correspondiente, usando podman:

```bash
podman pull quay.io/coreos/fcct:release
podman run -i --rm quay.io/coreos/fcct:release --pretty --strict < var/conf/mycroserver.fcc > var/conf/mycroserver.ign
```
usermod -a -G kvm elususario
usermod -a -G libvirt elususario
```
