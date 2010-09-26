# increase number of files that can be open at one time
ulimit -n 6000

alias ll='ls -lah'

alias eprof='mate ~/.dotfiles/' # because i edit my bash_profile a lot with new things
alias sprof='source ~/.bash_profile' # same as previous, after editing you have to source it for the new stuff to work
alias publickey='cat ~/.ssh/id_dsa.pub | pbcopy'

function f() {
  find * -name $1
}

# replacement netstat cmd to find ports used by apps on OS X
alias netstat_osx="sudo lsof -i -P"

# from http://blog.macromates.com/2008/working-with-history-in-bash/
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

