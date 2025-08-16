
# Kubernetes Cluster with Kubespray

This repository documents the setup of a production-ready Kubernetes cluster using [Kubespray](https://github.com/kubernetes-sigs/kubespray).  
It includes step-by-step instructions, inventory examples, diagrams, and Ansible playbooks for additional tooling.

## Features
- Automated cluster provisioning with Ansible + Kubespray
- Multi-node setup (control plane, etcd, workers)
- SSH automation
- Example playbook for installing k9s
- Architecture diagrams

## Architecture Diagram
![Cluster Architecture](diagrams/architecture.png)

## Inventory Example
```ini
[all]
node1 ansible_host=192.168.10.11 ip=192.168.10.11
node2 ansible_host=192.168.10.12 ip=192.168.10.12
node3 ansible_host=192.168.10.13 ip=192.168.10.13

[kube_control_plane]
node1

[etcd]
node1

[kube_node]
node2
node3

[k8s_cluster:children]
kube_control_plane
kube_node
```

## Playbook Example
Install `k9s` on all nodes:
```bash
ansible-playbook -i inventory/mycluster/inventory.ini playbooks/install-k9s.yml
```

## SSH Setup
Use `scripts/ssh-setup.sh` to generate and copy SSH keys.

## License
MIT License
