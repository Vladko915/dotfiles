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

 for pc in {"core","kube-core","kube-control"};do (VBoxManage showvminfo $pc | grep -E "Memory size|Number of CPUs|State") && echo -e '\n---\n'; done


for ip in {10,21,22}; do ssh user@192.168.0.$ip 'source ~/.bash_aliases && sep'; done
#sep is a function of ~/.bash_aliases
#sep ()
#{
#    echo -e '\n-----\n'
#}



grep -r "hosts.ini" ~/dotfiles
grep -r "kubernetes" ~/dotfiles
---------------------------------
bash> type ktp
ktp is a function
ktp ()
{
    kubectl top pods
}

bash> watch "kubectl top pods"
OR
bash> watch 'bash -ic "ktp"'

bash> alias kgnw6="kgnw | awk '{print \$6}' | sed -n '1p;2,4p' | xargs"

bash> for cmd in {'ping -c 3','traceroute','curl -v'}; do $cmd ***.com; echo -e "\n"; done

bash> hostnamectl
bash> ip -a
bash> ip neigh
bash> arp -a

ss -tanp //tcp-connects

ip route          # переглянути таблицю маршрутів
ip addr           # переглянути IP-адреси інтерфейсів
ip neigh          # переглянути ARP-таблицю
ping 8.8.8.8      # перевірити зв'язок
traceroute 8.8.8.8  # побачити шлях пакетів (або tracepath, якщо traceroute не встановлено)

cat /etc/resolv.conf //nameserver

----------------------------------------

for ip in {10,21,22}; do curl http://192.168.0.$ip:30500/v2/_catalog && sep ;done

//fast clear registry from kontrol-node1
kubectl -n kube-system scale deployment registry --replicas=0
ssh user@kube-worker1 "sudo rm -rf /mnt/registry/*"
kubectl -n kube-system scale deployment registry --replicas=1

user@pc:~/screenshot-bot$ cat /etc/docker/daemon.json
{
  "insecure-registries": ["192.168.0.10:30500","192.168.0.21:30500","192.168.0.22:30500"]
}

sudo systemctl restart docker

docker build -t 192.168.0.10:30500/screenshot-bot:1.0.0 .
docker push 192.168.0.10:30500/screenshot-bot:1.0.0

scp -r k8s kube-control1:~/k8s

kubectl apply -f ~/k8s/secret.yaml
kubectl apply -f ~/k8s/configmap.yaml
kubectl apply -f ~/k8s/deployment.yaml

#delete
kubectl delete -f ~/k8s/deployment.yaml
kubectl delete -f ~/k8s/configmap.yaml
kubectl delete -f ~/k8s/secret.yaml
OR
kubectl delete -f ~/k8s/

#check
kubectl get deployments
kubectl get pods
kubectl get configmaps
kubectl get secrets
OR
kubectl get deployments,pods,configmaps,secrets
----------------------------------

If broken kube-control-plane-noda:
1) sudo kubeadm reset -f
2) generate new token from kube-control-plane-noda
3) sudo kubeadm join 192.168.0.10:6443.....
4) check: $HOME/.kube/config