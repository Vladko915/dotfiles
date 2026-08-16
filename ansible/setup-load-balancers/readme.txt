bash> type apis
apis is pseudo for « ansible-playbook --ask-vault-pass --ask-become-pass -i »


#check inventory:

ansible-inventory -i setup-load-balancers/inventory.ini --graph

Next:

ansible-inventory -i setup-load-balancers/inventory.ini --host load-balancer-01
ansible-inventory -i setup-load-balancers/inventory.ini --host kubernetes-api
ansible-inventory -i setup-load-balancers/inventory.ini --host keepalived-settings

Check playbook:

apis  setup-load-balancers/inventory.ini setup-load-balancers/setup-load-balancers.yml --syntax-check

Next2:

apis  setup-load-balancers/inventory.ini setup-load-balancers/setup-load-balancers.yml --check

If all correct, run:

apis setup-load-balancers/inventory.ini setup-load-balancers/setup-load-balancers.yml
apis setup-load-balancers/inventory.ini setup-load-balancers/verify-keepalived-ha.yml
apis setup-load-balancers/inventory.ini setup-load-balancers/setup-ha-control-plane.yml