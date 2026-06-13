#terraform

if command -v terraform >/dev/null 2>&1; then
    teri(){ terraform init; }
    terp(){ terraform plan; }
    tera(){ terraform apply; }
    ters(){ terraform show; }
    terd(){ terraform destroy; }
fi