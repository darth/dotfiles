function prepend_to_var() {
  eval value=\$${1}
  if [[ $value != *:${2}:* && $value != ${2}:* && $value != *:${2} ]]; then
    if [ -z "${value}" ]; then
      export ${1}="${2}"
    else
      export ${1}="${2}:${value}"
    fi
  fi
}

function is_remote_session() {
  [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
}

if tty -s && [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  BREW_PREFIX=$(brew --prefix)
  if [ -f ${BREW_PREFIX}/share/bash-completion/bash_completion ]; then
    . ${BREW_PREFIX}/share/bash-completion/bash_completion
  fi
  export PKG_CONFIG_PATH=${BREW_PREFIX}/opt/python/Frameworks/Python.framework/Versions/Current/lib/pkgconfig/

  export CLIPBOARD_PORT='52699'

  export FZF_DEFAULT_COMMAND='rg --files --follow -g ""'

  # this is the hack to avoid prepending system paths in subshells
  unset PATH
  eval $(/usr/libexec/path_helper -s)
  prepend_to_var PATH "${HOME}/.config/yarn/global/node_modules/.bin"
  export EDITOR='nvim'
else
  export CLIPBOARD_PORT='52698'
  export EDITOR='vim'
fi

export COPY_COMMAND="${HOME}/bin/rcopy -p ${CLIPBOARD_PORT}"
export PASTE_COMMAND="${HOME}/bin/rpaste -p ${CLIPBOARD_PORT}"

export GOPATH="${HOME}/go"

prepend_to_var PATH '/sbin'
prepend_to_var PATH '/usr/sbin'
prepend_to_var PATH "${HOME}/bin"
prepend_to_var PATH "${GOPATH}/bin"
prepend_to_var PATH 'node_modules/.bin'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PAGER='less'

LESSPIPE=`which src-hilite-lesspipe.sh`
if [ -n "${LESSPIPE}" ]; then
  export LESSOPEN="| ${LESSPIPE} %s"
  export LESS=' -R -X -F '
fi

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

[ -f ~/.bash-preexec.sh ] && source ~/.bash-preexec.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -n "$TMUX" ]; then
  function refresh() {
    v=$(tmux showenv DISPLAY)
    [[ ${v:0:1} != '-' ]] && eval ${v}
    v=$(tmux showenv SSH_AUTH_SOCK)
    [[ ${v:0:1} != '-' ]] && eval ${v}
  }
else
  function refresh() {
    return
  }
fi

preexec() {
  refresh
}

if [ -f ${HOME}/.bashrc.local ]; then
  source ${HOME}/.bashrc.local
fi

if shopt -q login_shell && which tmux >/dev/null 2>&1; then
  #if not inside a tmux session, and if no session is started, start a new session
  if [ "$TERM" != "tmux-256color" ]; then
    tmux attach -t default || tmux new-session -s default
  fi
fi
