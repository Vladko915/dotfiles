#Example

folders:
-core
-kube-core
-kube-control
-kube-worker

apis є псевдонімом до «ansible-playbook --ask-vault-pass --ask-become-pass -i »


#steps - 1:
ansible-playbook -i core/core.ini core/pb_remove_sudors.yml --ask-vault-pass
ansible-playbook -i core/core.ini core/pb_sync_time.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core/core.ini core/pb_edit_hostname.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core/core.ini core/pb_copy_bash_aliases.yml --ask-vault-pass
ansible-playbook -i core/core.ini core/pb_infoall.yml --ask-vault-pass
ansible-playbook -i core/core.ini core/pb_sudo_group.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core/core.ini core/pb_copy_ssh_keygen_service.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core/core.ini core/pb_prepare_system.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core/core.ini core/pb_poweroff.yml --ask-vault-pass  --ask-become-pass

OR

ansible-playbook -i core/core.ini core/pb_main.yml --ask-vault-pass --ask-become-pass

-----------------------------------------------------------------------------------------

#steps - 2:

ansible-playbook -i kube-core/kube-core.ini kube-core/pb_edit_hostname.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_ping_web.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_disable_swap.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_ip_forward_setup.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_install_containerd.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_install_kubernetes.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_clear_ssh_machineid_logs.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-core/kube-core.ini kube-core/pb_poweroff.yml --ask-vault-pass  --ask-become-pass

OR

ansible-playbook -i kube-core/kube-core.ini kube-core/pb_main.yml --ask-vault-pass --ask-become-pass

---------------------------------


#steps - 3(Control-Plane-Noda):


apis kube-control/01_dhcp.ini kube-control/pb_change_to_static_ip.yml
+
ansible-playbook -i kube-control/kube-control.ini kube-control/pb_edit_hostname.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-control/kube-control.ini kube-control/pb_ping_web.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-control/kube-control.ini kube-control/pb_kubeadm_init.yml--ask-vault-pass --ask-become-pass

#ansible-playbook -i kube-control/kube-control.ini kube-control/pb_clear_ssh_machineid_logs.yml --ask-vault-pass --ask-become-pass
#ansible-playbook -i kube-control/kube-control.ini kube-control/pb_poweroff.yml --ask-vault-pass  --ask-become-pass

OR

apis kube-control/01_dhcp.ini kube-control/pb_change_to_static_ip.yml
apis kube-control/02_static.ini kube-control/pb_main.yml

---------------------------------

#steps - 4(Worker-Noda):

apis kube-worker/01_dhcp.ini kube-worker/pb_change_to_static_ip.yml
+
ansible-playbook -i kube-worker/kube-worker.ini kube-worker/pb_edit_hostname.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-worker/kube-worker.ini kube-worker/pb_ping_web.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-worker/kube-worker.ini kube-worker/pb_worker_join.yml --ask-vault-pass --ask-become-pass

#ansible-playbook -i kube-worker/kube-worker.ini kube-worker/pb_clear_ssh_machineid_logs.yml --ask-vault-pass --ask-become-pass
#ansible-playbook -i kube-worker/kube-worker.ini kube-worker/pb_poweroff.yml --ask-vault-pass  --ask-become-pass

OR

apis kube-worker/01_dhcp.ini kube-worker/pb_change_to_static_ip.yml
apis kube-worker/02_static.ini kube-worker/pb_main.yml


---------------------------
Maintenance:

ansible-playbook -i maintenance/all.ini maintenance/pb_up_bash_aliases.yml --ask-vault-pass --ask-become-pass
OR
apis maintenance/all.ini maintenance/pb_up_bash_aliases.yml



apis maintenance/all.ini maintenance/pb_reboot.yml



Experimentals:

for ip in {119,120,121}; do ssh user@192.168.0.$ip hostname; done
for ip in {119,120,121}; do ssh user@192.168.0.$ip 'hostname && hostname -I && echo -e "\n"'; done


for ip in {120,121}; do ssh user@192.168.0.$ip 'hostname && hostname -I && echo -e "\n"'; done

for ip in {21,22}; do ssh user@192.168.0.$ip 'hostname && hostname -I && echo -e "\n"'; done

//use alias
user@pc:~/dotfiles/ansible$ ssh user@192.168.0.120 'bash -lc "
shopt -s expand_aliases
source ~/.bash_aliases
eval galiaspv
"'
//use function from ~/.bash_aliases
ssh user@192.168.0.120 "bash -lc 'source ~/.bash_aliases && curtime'"

for ip in {10,105,106}; do ssh user@192.168.0.$ip 'hostname && hostname -I && echo -e "\n"'; done

