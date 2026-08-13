1. Create self-signed CA.

mkdir -p ~/registry-certs && cd ~/registry-certs

cat > registry.cnf << 'EOF'
[req]
distinguished_name = req_distinguished_name
x509_extensions = v3_req
prompt = no

[req_distinguished_name]
CN = registry.local

[v3_req]
keyUsage = keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
IP.1 = 192.168.0.10
IP.2 = 192.168.0.21
IP.3 = 192.168.0.22
DNS.1 = registry.local
EOF

#generate sert and private key( for 10 year )
openssl req -newkey rsa:4096 -nodes -sha256 \
  -keyout registry.key -x509 -days 3650 \
  -out registry.crt -config registry.cnf -extensions v3_req

#check
openssl x509 -in registry.crt -noout -text | grep -A 5 "Subject Alternative Name"

----------------------------------------

2. Added sert to Kubernetes as Secret

kubectl create secret tls registry-tls-secret \
  --cert=registry.crt \
  --key=registry.key \
  -n kube-system

----------------------------------------

3. Apply register-deployment - enabled TLS

kubectl apply -f registry_with_https.yaml
kubectl -n kube-system rollout restart deployment registry

----------------------------------------

4.Added sert to pc-work for push/pull

sudo mkdir -p /etc/docker/certs.d/192.168.0.10:30500
sudo cp registry.crt /etc/docker/certs.d/192.168.0.10:30500/ca.crt
sudo systemctl restart docker


----------------------------------------

5. Added support of cert for containerd (everyone node of Kubernetes-claster)

sudo mkdir -p /etc/containerd/certs.d/192.168.0.10:30500
sudo cp registry.crt /etc/containerd/certs.d/192.168.0.10:30500/ca.crt

sudo tee /etc/containerd/certs.d/192.168.0.10:30500/hosts.toml <<EOF
server = "https://192.168.0.10:30500"

[host."https://192.168.0.10:30500"]
  capabilities = ["pull", "resolve", "push"]
  ca = "/etc/containerd/certs.d/192.168.0.10:30500/ca.crt"
EOF

sudo systemctl restart containerd

----------------------------------------

6. Check

curl https://192.168.0.10:30500/v2/_catalog

Answer:
{"repositories":["screenshot-bot"]}
----------------------------------------

ls -la /usr/local/share/ca-certificates/
sudo cp registry.crt /usr/local/share/ca-certificates/registry-local.crt
sudo update-ca-certificates
ls -la /usr/local/share/ca-certificates/
curl https://192.168.0.21:30500/v2/_catalog

----------------------------------------

----------------------------------------

----------------------------------------

----------------------------------------

----------------------------------------

----------------------------------------

----------------------------------------
