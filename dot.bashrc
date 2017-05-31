function prepend_to_var() {
  eval value=\$${1}
  if [[ ! "${value}" == *${2}* ]]; then
    if [ -z "${value}" ]; then
      export ${1}="${2}"
    else
      export ${1}="${2}:${value}"
    fi
  fi
}

if tty -s && [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  BREW_PREFIX=$(brew --prefix)
  if [ -f ${BREW_PREFIX}/share/bash-completion/bash_completion ]; then
    . ${BREW_PREFIX}/share/bash-completion/bash_completion
  fi
  export PKG_CONFIG_PATH=${BREW_PREFIX}/opt/python/Frameworks/Python.framework/Versions/Current/lib/pkgconfig/

  # this is the hack to avoid prepending system paths in subshells
  unset PATH
  eval $(/usr/libexec/path_helper -s)
fi

export GOPATH="${HOME}/go"

prepend_to_var PATH '/sbin'
prepend_to_var PATH '/usr/sbin'
prepend_to_var PATH "${HOME}/bin"
prepend_to_var PATH "${GOPATH}/bin"
prepend_to_var PATH 'node_modules/.bin'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'
export PAGER='less'

LESSPIPE=`which src-hilite-lesspipe.sh`
if [ -n "${LESSPIPE}" ]; then
  export LESSOPEN="| ${LESSPIPE} %s"
  export LESS=' -R -X -F '
fi

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

tty -s && [ -f ~/.bash-powerline.sh ] && source ~/.bash-powerline.sh

# history stuff
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
shopt -s histappend

# some other opts
shopt -s cdspell
shopt -s autocd

# aliases
alias ls='ls -F'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias e="${EDITOR}"
alias r="${PAGER}"

if [ -f ${HOME}/.bashrc.local ]; then
  source ${HOME}/.bashrc.local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  export COPY_COMMAND="${HOME}/bin/rcopy"
  export PASTE_COMMAND="${HOME}/bin/rpaste"
fi

if shopt -q login_shell && which tmux >/dev/null 2>&1; then
  #if not inside a tmux session, and if no session is started, start a new session
  if [ "$TERM" != "screen-256color" ]; then
    tmux attach -t default || tmux new-session -s default
  fi
fi
