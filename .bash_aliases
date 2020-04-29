alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias vi='vim'
alias system-upgrade="sudo apt-get update && sudo apt-get -y upgrade"
alias tmux="TERM=xterm-256color tmux"
alias reload="source ~/.bashrc"
alias clip="xclip -selection clipboard"
alias reload-wp="feh --bg-fill '/home/hpoe/Pictures/omaha_beach_d_day_wallpaper-1920x1080.jpg'" 

alias emacst='emacs -nw'
alias em='emacsclient -t'
alias emacsd='emacs --daemon'
alias emacsr="emacsclient -e '(kill-emacs)' && emacsd"

# Terraform aliases
alias tf="terraform"
alias tfd="terraform destroy"
alias tfa="terraform apply"
alias tfaa="terraform apply -auto-approve"
alias tfda="terraform destroy -auto-approve"
alias tfv="terraform validate"
alias tfdoc="terraform-docs ."
alias tfget="terraform get --update"
alias tffmt="terraform fmt"
alias tfout="terraform output"

# Git Alias
alias gits="git status"
alias gitadd="git add -A"
alias gitd="git diff"
alias gitc="git commit -m"
alias gitp="git push"

# Project Find Alias
alias pfind='find . -type f | xargs grep -n'
alias rfind='find . -type f -name "*.rb" | xargs grep -n'
alias gofind='find . -type f -name "*.go" | xargs grep -n'
alias tffind='find . -type f -name "*.tf"  | grep -v "\.terraform/modules/" | xargs grep -n'
alias jfind='find . -type f -name "*.java" | xargs grep -n'

alias gsed='sed'
