set -o vi

blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# PS1='${debian_chroot:+($debian_chroot)}$(git_branch)'${pur}' \W'${grn}' \$ '${clr}
# PS1=' \w '
PS1=" \[\e[0;34m\]\w\[\e[0m\] "

alias school='cd ~/dev/CIS-115/'
alias vimrc='vim ~/.config/nvim/init.lua'
alias bashrc='vim ~/.bashrc'
alias kararc='vim ~/.config/karabiner/karabiner.json'
alias ghost='vim ~/.config/ghostty/config'
alias ls='ls --color=auto'

vim() {
  if [[ $# -eq 0 ]]; then
    nvim -c ':Ex'
  else
    nvim "$@"
  fi
}

export EDITOR='nvim'

export FZF_DEFAULT_OPTS="--style full --preview 'fzf-preview.sh {}' --bind 'focus:transform-header:file --brief {}'"

function v() {
  local file
  file=$(fzf) || return  # exit if no file selected
  vim "$file"
}
