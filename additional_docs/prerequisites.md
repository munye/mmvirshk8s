El usuario que levante el servidor debe teneer como grupos secundarios kvm y probablemente libvirtd
```
# Ignition Configuration file
- Se transpila con fedora coreos transpiler
- Corre dentro de un contenedor

```bash
podman pull quay.io/coreos/fcct:release
podman run -i --rm quay.io/coreos/fcct:release --pretty --strict < var/conf/mycroserver.fcc > var/conf/mycroserver.ign
```
usermod -a -G kvm elususario
usermod -a -G libvirt elususario
```
