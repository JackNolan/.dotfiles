if [ -n `which git` ]; then

  function gpx() {
    if [ -n $(git config remote.origin.url | grep ssh://reviews) ]; then
      gerrit push
    else
      git push
    fi
  }

  function gprm() {
    local startBranch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/')
    git checkout master
    if [[ $(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/' | grep "master") == "" ]]; then
      git checkout$startBranch 
      echo Failed to find master branch pull aborted
    else
    git pull --rebase
    git checkout$startBranch
  fi
  }
  
  alias gp='git push'
  alias gst='git status'
  alias gl='git pull'
  alias gpa='git push-all' # see [alias] in ~/.gitconfig
  alias gd='git diff --no-color | $EDITOR'
  alias ga='git add'
  alias gcl='git config --list'
  alias gc='git commit -v'
  alias gca='git commit -v -a'
  alias gb='git branch'
  alias gbc='git branch --color'
  alias gba='git branch -a'
  alias gco='git checkout'
  alias gpatch='git diff master -p'
  alias gitrm="git status | grep deleted | awk '{print $3}' | xargs git rm"
  alias gitx="open -b nl.frim.GitX"

  function gpall() {
    for remote in `git remote show`
    do
      `git push $remote --all`
    done
  }

  alias gpb="git push banana master && hudson build"
  
fi

if [[ -n `which hub` ]]; then
  eval "$(hub alias -s)"
fi
