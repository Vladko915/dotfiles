
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



