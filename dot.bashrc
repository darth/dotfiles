. "${HOME}/.common.bash"

if tty -s && [ $(uname) = 'Darwin' ]; then # OS X specific stuff
  BREW_PREFIX=$(brew --prefix)
  if [ -f ${BREW_PREFIX}/share/bash-completion/bash_completion ]; then
    . ${BREW_PREFIX}/share/bash-completion/bash_completion
  fi
  export PKG_CONFIG_PATH=${BREW_PREFIX}/opt/python/Frameworks/Python.framework/Versions/Current/lib/pkgconfig/

  export FZF_DEFAULT_COMMAND='rg --files --follow -g ""'

  # this is the hack to avoid prepending system paths in subshells
  unset PATH
  eval $(/usr/libexec/path_helper -s)
  prepend_to_var PATH "${HOME}/.config/yarn/global/node_modules/.bin"
  if hash stack >/dev/null 2>&1; then
    prepend_to_var PATH "${HOME}/.local/bin" # haskell stack
    eval "$(stack --bash-completion-script stack)"
  fi
fi

if [ -n "${NVIM_LISTEN_ADDRESS}" ]; then
  if [ -x "$(command -v nvr)" ]; then
    alias nvim=nvr
  else
    alias nvim='echo "No nesting!"'
  fi
fi

if [ -z "${VISUAL}" ]; then
  export VISUAL='nvim'
fi

export GOPATH="${HOME}/go"

prepend_to_var PATH '/sbin'
prepend_to_var PATH '/usr/sbin'
prepend_to_var PATH "${HOME}/bin"
prepend_to_var PATH "${GOPATH}/bin"
prepend_to_var PATH 'node_modules/.bin'

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PAGER='less'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

tty -s && [ -f ~/.bash-powerline.sh ] && source ~/.bash-powerline.sh

# history stuff
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
shopt -s histappend

# some other opts
shopt -s cdspell
shopt -s autocd
shopt -s direxpand

# aliases
alias ls='ls -F'
alias l='ls'
alias ll='ls -l'
alias la='ls -la'
alias df='df -h'
alias du='du -h'
alias grep='grep --color'
alias e="nvim"
alias r="${PAGER}"

[ -f ~/.bash-preexec.sh ] && source ~/.bash-preexec.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -d ~/.password-store ]; then
  export PASSWORD_STORE_ENABLE_EXTENSIONS=true
fi

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

if shopt -q login_shell && hash tmux >/dev/null 2>&1; then
  #if not inside a tmux session, and if no session is started, start a new session
  if [ "$TERM" != "tmux-256color" ]; then
    tmux attach -t default || tmux new-session -s default
  fi
fi
