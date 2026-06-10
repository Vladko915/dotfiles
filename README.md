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

for ip in {10,21,22}; do ssh user@192.168.0.$ip "hostname && free -m && echo -e '\n'"; done
for ip in {10,21,22}; do host="user@192.168.0.$ip"; ssh $host "hostname && echo $host && free -m && echo -e '\n'"; done

allhosts()
{
    for ip in {10,21,22};
    do
        host="user@192.168.0.$ip";
        ssh $host "hostname && echo $host && free -m && echo -e '\n'";
    done
}

ansible-vault edit group_vars/core/vault.yml
ansible-vault edit group_vars/core/sudo_pass.yml

grep -r "hosts.ini" ~/dotfiles
grep -r "kubernetes" ~/dotfiles

If broken kube-control-plane-noda:
1) sudo kubeadm reset -f
2) generate new token from kube-control-plane-noda
3) sudo kubeadm join 192.168.0.10:6443.....
4) check: $HOME/.kube/config