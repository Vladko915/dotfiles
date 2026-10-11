
alias psg="ps aux | grep"
alias myip="curl ifconfig.me"
alias ports="ss -tulpn"
alias pingg="ping google.com"

alias jl="journalctl"
alias jl10="journalctl -n 10"

ghosts()
{
printf "%-20s %s\n" "HOST" "HOSTNAME"
printf "%-20s %s\n" "----" "--------"
awk '
  /^Host / && !/\*/ { host=$2 }
  /^[[:space:]]+HostName / { printf "%-20s %s\n", host, $2 }
' ~/.ssh/config
}

#tailscale
if command -v tailscale >/dev/null 2>&1; then
    ts(){ tailscale "$1"; }
    tss(){ tailscale status; }
    tsip(){ tailscale ip; }
fi