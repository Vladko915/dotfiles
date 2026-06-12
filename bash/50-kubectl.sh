#kubectl
if command -v kubectl >/dev/null 2>&1; then

  k()
  {
    kubectl "$@"
  }

  kgp()
  {
    kubectl get pods "$@"
  }

  kgd()
  {
    kubectl get deployments "$@"
  }

  kgs()
  {
    kubectl get services "$@"
  }

  kgn()
  {
    kubectl get nodes "$@"
  }

  kgns()
  {
    kubectl get namespaces "$@"
  }

  ksd()
  {
    kubectl scale deployments "$1" --replicas="$2"
  }

fi

#kubeadm
if command -v kubeadm >/dev/null 2>&1; then

  katoken()
  {
    kubeadm token create --print-join-command
  }

fi
