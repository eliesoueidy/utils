PS1="\[\e[32;1m\](\[\e[34;1m\] \u \[\e[32;1m\])-(\[\e[31;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\] \t \[\e[32;1m\])-> \[\e[0m\]"

alias ls='ls -G'
alias ll='ls -lh'

#to put files in Trash instead of permanently deleting them
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}

source ~/.git-completion.bash
