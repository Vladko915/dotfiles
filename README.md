# dotfiles
Dotfiles for Debian/Ubuntu-based servers



#Example

ansible-playbook -i core.ini playbook_aliases.yml --ask-vault-pass

#more
sudo systemctl start ssh
sudo systemctl stop ssh
sudo systemctl status ssh

journalctl -u ssh -n 10
journalctl -u ssh -p err
journalctl -u ssh -f
journalctl -u ssh --since "1 hour ago"


sudo ssh-keygen -A  //generate new host-keys
ssh-keygen -R 192.168.0.100 //remove old host-keys of client


ansible-vault edit group_vars/core/vault.yml
ansible-vault edit group_vars/core/sudo_pass.yml

x