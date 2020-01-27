prepend_to_var() {
  eval value=\$${1}
  if [[ $value != *:${2}:* && $value != ${2}:* && $value != *:${2} && $value != ${2} ]]; then
    if [ -z "${value}" ]; then
      export ${1}="${2}"
    else
      export ${1}="${2}:${value}"
    fi
  fi
}

is_remote_session() {
  [ -n "$SSH_CONNECTION" ]
}

is_exec() {
  [ -x "$(command -v $1)" ]
}
