if [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
  if [ -d $(brew --prefix python) ]; then
    export PKG_CONFIG_PATH=$(brew --prefix python)/Frameworks/Python.framework/Versions/Current/lib/pkgconfig/
  fi
else
  export PATH="/usr/sbin:/sbin:${PATH}"
fi

export GOPATH="${HOME}/go"

export PATH="${HOME}/bin:${GOPATH}/bin:/usr/local/bin:${PATH}"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'

# history stuff
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# some other opts
shopt -s cdspell
shopt -s autocd

# prompt
function _update_ps1() {
  export PS1="$(~/.powerline-shell.py $?)"
}
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"

# aliases
alias ls='ls -F'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias e="${EDITOR}"

if [ -f ${HOME}/.bashrc.local ]; then
  source ${HOME}/.bashrc.local
fi
