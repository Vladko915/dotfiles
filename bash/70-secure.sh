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




