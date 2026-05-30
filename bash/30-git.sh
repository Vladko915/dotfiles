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
