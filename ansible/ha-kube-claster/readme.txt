bash> type apis
apis is pseudo for « ansible-playbook --ask-vault-pass --ask-become-pass -i »


#check inventory:

ansible-inventory -i ha-kube-claster/inventory.ini --graph

Next:

ansible-inventory -i ha-kube-claster/inventory.ini --host load-balancer-01
ansible-inventory -i ha-kube-claster/inventory.ini --host kubernetes-api
ansible-inventory -i ha-kube-claster/inventory.ini --host keepalived-settings

Check playbook:

apis  ha-kube-claster/inventory.ini ha-kube-claster/setup-load-balancers.yml --syntax-check

Next2:

apis  ha-kube-claster/inventory.ini ha-kube-claster/setup-load-balancers.yml --check

If all correct, run:

apis ha-kube-claster/inventory.ini ha-kube-claster/01-setup-kube-core-for-control-planes.yml

apis ha-kube-claster/inventory.ini ha-kube-claster/02-setup-load-balancers.yml
apis ha-kube-claster/inventory.ini ha-kube-claster/03-verify-keepalived-ha.yml

apis ha-kube-claster/inventory.ini ha-kube-claster/04-cleanup-kube-control-claster-settings.yml
apis ha-kube-claster/inventory.ini ha-kube-claster/05-setup-ha-kube-control-plane.yml

apis ha-kube-claster/inventory.ini ha-kube-claster/06-cleanup-kube-worker-claster-settings.yml
apis ha-kube-claster/inventory.ini ha-kube-claster/07-setup-kube-core-workers.yml
apis ha-kube-claster/inventory.ini ha-kube-claster/08-join-kube-for-workers.yml

apis ha-kube-claster/inventory.ini ha-kube-claster/09-configure-control-plane-metrics.yml
apis ha-kube-claster/inventory.ini ha-kube-claster/10-configure-worker-metrics.yml

OR

apis ha-kube-claster/inventory.ini ha-kube-claster/setup-ha-kube-claster.yml


for ip in {93,94,95,96,97,98,99}; do ssh-keygen -f ~/.ssh/known_hosts -R 192.168.0.$ip; done

df -h
df -ih
lsblk

user@load-balancer-01:/var/cache/apt/archives$ sudo du -sh /var/cache/apt/archives/
162M	/var/cache/apt/archives/

sudo apt clean

systemctl status pvestatd
systemctl restart pvestatd


