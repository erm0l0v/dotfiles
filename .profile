export GOPATH=/Users/kej/sourse/golang
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export DB_MODE=r


eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source ~/.git-prompt.sh
source ~/.git-completion.sh
source ~/.config/django/django_complition.sh
source /usr/local/etc/bash_completion.d/npm


function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

git_push_master() {
    target_branch="master"
    if [ "$#" -gt "0" ]
    then
        name=$1
    else
        a=$(parse_git_branch)
        name=${a:2:${#a}-3}
    fi
    if [ "$2" ]
    then
        target_branch=$2
    fi
    echo "git push origin HEAD:refs/for/$target_branch/$name" 
    git push origin HEAD:refs/for/$target_branch/$name
}

git_checkout() {
    if [ "$#" -eq "1" ]
    then
        a=$(parse_git_branch)
        name=${a:2:${#a}-3}
        git fetch origin
        git checkout -b $1 origin/master
        if [ "$name" != "master" ]
        then
            git branch -D $name
        fi
    fi
}

alias pm=git_push_master
alias co=git_checkout
alias coursetalk="cd ~/sourse/repos/www.coursetalk.org/"
alias ls="ls -G"
alias git_l="git log --all --graph --pretty=format:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold
blue)<%an>%Creset' --abbrev-commit --date=relative"
alias git_s="git status -sb"
alias fuck='eval $(thefuck $(fc -ln -1)); history -r'
# You can use whatever you want as an alias, like for Mondays:
alias FUCK='fuck'
source ~/bash_helpers/virtualenv-auto-activate.sh

alias green="ssh -i ~/coursetalk.pem ubuntu@10.2.100.77"

# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."

# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="."

# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="."

# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"


# RED="\[\033[0;31m\]"
# YELLOW="\[\033[0;33m\]"
# GREEN="\[\033[0;32m\]"
# NO_COLOUR="\[\033[0m\]"
# PS1="$GREEN@\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

export PATH=/usr/local/bin:$PATH

export DEPLOY_DIR=/Users/kej/sourse/repos/coursetalk
