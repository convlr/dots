set -o vi

function git_branch() {
    if [ -d .git ] ; then
        printf "%s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

export PS1="\[\e[0;34m\]\w\[\e[0m\] "

alias projects='cd ~/dev/projects/'
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
