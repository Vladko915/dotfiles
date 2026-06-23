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

  kgpw()
  {
    kubectl get pods -o wide "$@"
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

  kgnw()
  {
    kubectl get nodes -o wide "$@"
  }

  kgns()
  {
    kubectl get namespaces "$@"
  }

  ksd()
  {
    kubectl scale deployments "$1" --replicas="$2"
  }

  ktp()
  {
    kubectl top pods
  }

  ktn()
  {
    kubectl top nodes
  }

  kdd()
  {
    kubectl describe deployment "$@"
  }

  kds()
  {
    kubectl describe service "$@"
  }


  kdp()
  {
    kubectl describe pod "$@"
  }

  kga()
  {
    kubectl get all "$@"
  }

  kgev()
  {
    kubectl get events "$@"
  }

  kgen()
  {
    kubectl get endpoints "$@"
  }

  kaf()
  {
    kubectl apply -f "$@"
  }


fi


#kubeadm
if command -v kubeadm >/dev/null 2>&1; then

  katoken()
  {
    kubeadm token create --print-join-command
  }

fi

#egrep
if command -v egrep >/dev/null 2>&1; then

  egreps()
  {
    egrep "^Name:|^Namespace:|^Node:|^IP:|^Status|^Labels:"
  }

fi
