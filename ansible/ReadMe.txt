#Example

folders:
-core
-kube-core
-kube-control
-kube-worker

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


#steps - 3:

ansible-playbook -i kube-control/kube-control.ini kube-control/pb_edit_hostname.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-control/kube-control.ini kube-control/pb_ping_web.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i kube-control/kube-control.ini kube-control/pb_kubeadm_init.yml--ask-vault-pass --ask-become-pass

#ansible-playbook -i kube-control/kube-control.ini kube-control/pb_clear_ssh_machineid_logs.yml --ask-vault-pass --ask-become-pass
#ansible-playbook -i kube-control/kube-control.ini kube-control/pb_poweroff.yml --ask-vault-pass  --ask-become-pass

OR

ansible-playbook -i kube-control/kube-control.ini kube-control/pb_main.yml --ask-vault-pass --ask-become-pass


