#Example

folders:
-core
-kube-core
-kube-control
-kube-worker

#steps:
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


Experimental:

ansible-playbook -i core/core.ini core/pb_edit_hostname.yml --ask-vault-pass  --ask-become-pass



