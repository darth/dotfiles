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

export PATH="${HOME}/bin:node_modules/.bin:${GOPATH}/bin:/usr/local/bin:${PATH}"

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR='vim'

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PS1='\['"`tput sc`"'\]  \['"`tput rc`"' \]'

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

if [ -f ${HOME}/.bashrc.local ]; then
  source ${HOME}/.bashrc.local
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if shopt -q login_shell && which tmux >/dev/null 2>&1; then
  #if not inside a tmux session, and if no session is started, start a new session
  if [ "$TERM" != "screen-256color" ]; then
    tmux attach -t default || tmux new-session -s default
  fi
fi
