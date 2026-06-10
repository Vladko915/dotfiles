#kubectl
if command -v kubectl >/dev/null 2>&1; then

  alias kgp="kubectl get pods"
  alias kgd="kubectl get deployments"
  alias kgs="kubectl get services"
  alias kgn="kubectl get nodes"

  ksd ()
  {
    kubectl scale deployments "$1" --replicas="$2"
  }

fi

#kubeadm
if command -v kubeadm >/dev/null 2>&1; then

  alias katoken="kubeadm token create --print-join-command"

fi
