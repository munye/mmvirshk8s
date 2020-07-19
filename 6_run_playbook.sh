KUBESPRAY_HOME=$PWD/kubespray/
ansible-playbook -i $KUBESPRAY_HOME/inventory/mycluster/hosts.yaml  --become --become-user=root $KUBESPRAY_HOME/cluster.yml
