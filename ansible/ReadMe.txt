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

ansible-playbook -i core-kube/core-kube.ini core-kube/pb_edit_hostname.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core-kube/core-kube.ini core-kube/pb_ping_web.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core-kube/core-kube.ini core-kube/pb_disable_swap.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core-kube/core-kube.ini core-kube/pb_ip_forward_setup.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core-kube/core-kube.ini core-kube/pb_install_containerd.yml --ask-vault-pass --ask-become-pass
ansible-playbook -i core-kube/core-kube.ini core-kube/pb_install_kubernetes.yml --ask-vault-pass --ask-become-pass


#ansible-playbook -i core-kube/core-kube.ini core-kube/pb_clear_ssh_machineid_logs.yml --ask-vault-pass --ask-become-pass
#ansible-playbook -i core-kube/core-kube.ini core-kube/pb_poweroff.yml --ask-vault-pass  --ask-become-pass



OR

ansible-playbook -i core-kube/core-kube.ini core-kube/pb_main.yml --ask-vault-pass --ask-become-pass


