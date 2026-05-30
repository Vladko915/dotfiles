#kubectl
if command -v kubectl >/dev/null 2>&1; then

  alias kgp="kubectl get pods"
  alias kgd="kubectl get deployments"
  alias kgs="kubectl get services"

  ksd ()
  {
    kubectl scale deployments "$1" --replicas="$2"
  }

fi
