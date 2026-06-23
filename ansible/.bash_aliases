

# =====00-version.sh=====
ALIAS_PACK_VERSION='0.16';

alias galiaspv='echo $ALIAS_PACK_VERSION';


# =====01-env.sh=====
if command -v mcedit >/dev/null 2>&1; then
    export EDITOR=mcedit
fi

export PATH="$HOME/bin:$PATH"
# =====10-base.sh=====

alias sudo='sudo '

alias cc="clear"
alias ll="ls -lih"
alias wl="wc -l"
alias wm="wc -m"
alias tt='sl; sl --help; sl -a; sl -l; sl -F'
alias trcomma="tr -s ',' '\n'"
alias trvg="tr -s '\n' ' '"
#trim for 1 word
alias trim="sed 's/^[ \t]*//;s/[ \t]*$//'"
#trims for all words in string
alias trims="awk '{\$1=\$1;print}'"
alias trd="tr -d ' '"
alias lsa="ls -a"
alias lr="ls -R"
alias ls1="ls -1"
alias lsd="ls -d */"
alias es1='echo -e "\n"'
alias dash1='echo -e "------------------"'
alias acs='apt-cache search '

alias ttt="echo $TERM"
alias sep="echo -e '\n-----\n'"

if command -v mcedit >/dev/null 2>&1; then
    alias bashrc="mcedit ~/.bashrc"
fi


#use as 'dash' OR 'dash 20'
dash() {
    printf '%*s\n' "${1:-18}" '' | tr ' ' '-'
}

curtime()
{
t11=$(date +%s);
echo $t11;
}

hostnameedit() {
    local tmpNewHostName="$1"

    if [ -z "$tmpNewHostName" ]; then
		echo "Error: please enter a new hostname"
		echo "Usage: hostnameedit newname"
        return 1
    fi

    sudo hostnamectl set-hostname "$tmpNewHostName" \
    && sudo sed -i "s/^127\.0\.1\.1.*/127.0.1.1 $tmpNewHostName/" /etc/hosts \
    && echo -e "hostname = $(hostname)" \
    && echo -e "/etc/hosts = '$(cat /etc/hosts | grep 127.0.1.1)'"
}

infoall()
{
    tmpSeparate() { echo -e "\n-----\n"; }

    tmpSeparate
    hostname
    tmpSeparate
    hostname -I
    tmpSeparate
    ping -c 3 8.8.8.8
    tmpSeparate
    sudo --version
    tmpSeparate
    timedatectl
    tmpSeparate
    hostnamectl
    tmpSeparate
    ip a
    tmpSeparate
    lsblk
    tmpSeparate
    df -h
    tmpSeparate
    locale
    tmpSeparate
    unset -f tmpSeparate
}




# =====20-network.sh=====

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
# =====30-git.sh=====
#git
if command -v git >/dev/null 2>&1; then

    alias gis="git status"
    alias gil="git log"
    alias gid="git diff"
    alias gids="git diff --staged"
    alias gidc="git diff --cached"
    alias gil1p="git log --pretty=oneline"
    alias gil1p5="git log --pretty=oneline -n 5"
    alias gil1p10="git log --pretty=oneline -n 10"
    alias gil1="git log --oneline"
    alias gil1d="dash; git log --oneline --decorate"
    alias gil1d1="dash; git log --oneline --decorate -n 1"
    alias gil1d10="dash; git log --oneline --decorate -n 10"
    alias gil1d5="dash; git log --oneline --decorate -n 5"
    alias gilp1f="git log --pretty=oneline --follow"
    alias gilf="git log --follow"
    alias gib="dash; git branch"
    alias gich="dash; git checkout"
    alias gihead="dash; git diff HEAD~1"
    alias gisl="dash; git stash list"
    alias gip="dash; git push -u origin main"

fi

# =====40-docker.sh=====
#docker
if command -v docker >/dev/null 2>&1; then

   alias doa="docker ps -a"
   alias doi="docker images"

   #functions
   dor ()
   {
      docker stop "$1" && docker rm "$1" && docker rmi "$1"
   }

fi


# =====50-kubectl.sh=====
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

# =====55-ansible.sh=====
if command -v ansible >/dev/null 2>&1; then
    arun() {
        ansible -i ~/hosts.ini kubernetes -m command -a "$1" | awk '/CHANGED/{print "----------"}1'
    }
fi

#WARNING
if command -v ansible >/dev/null 2>&1; then
    arunsh() {
        ansible -i ~/hosts.ini kubernetes -m shell -a "$1" | awk '/CHANGED/{print "--------------------"}1'
    }
fi

# =====60-terraform.sh=====
#terraform

if command -v terraform >/dev/null 2>&1; then
    teri(){ terraform init; }
    terp(){ terraform plan; }
    tera(){ terraform apply; }
    ters(){ terraform show; }
    terd(){ terraform destroy; }
fi
# =====70-secure.sh=====
#ssh

#idempotent call
if command -v ssh-agent >/dev/null 2>&1 && command -v ssh-add >/dev/null 2>&1; then
    alias inkey='
        if ! ssh-add -l >/dev/null 2>&1; then
            eval $(ssh-agent -s)
            ssh-add ~/.ssh/id_ed25519
            echo "SSH key successfully loaded"
        else
            echo "SSH key already active"
        fi
    '
fi

if command -v snyk >/dev/null 2>&1; then

    alias snk="snyk test"

fi





# =====80-aws.sh=====
#aws
# =====90-prompt.sh=====
#prompt

#add a empty line after the command output
PS1="\n$PS1";
# =====99-local.sh=====
#local/.gitignore