

function parse_git_status {
  if [[ $(git status 2> /dev/null | grep "Untracked files:") != "" ]]
   then echo -e "\033[0m - \033[0;33m" #=> yellow
  elif [[ $(git status 2> /dev/null | grep "modified:") != "" ]]
   then echo -e "\033[0m - \033[0;36m" #=> cyan
  elif [[ $(git status 2> /dev/null | grep "committed:") != "" ]]
   then echo -e "\033[0m - \033[0;35m" #=> magenta
  elif [[ $(git status 2> /dev/null | grep "deleted:") != "" ]]
   then echo -e "\033[0m - \033[0;31m" #=> red
 elif [[ $(git status 2> /dev/null | grep "nothing to commit") != "" ]]; then
  echo -e "\033[0m - \033[0;32m" #=> green
else
  echo ""
  fi
}
function parse_git_branch {
echo $(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1)/")
}


# RVM - disabled
function __my_rvm_ruby_version {
  local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
  [ "$gemset" != "" ] && gemset="@$gemset"
  local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
  [ "$version" == "1.8.7" ] && version=""
  local full="$version$gemset"
  [ "$full" != "" ] && echo "$full "
}

function bash_prompt
{


local NONE="\[\033[0m\]"    # unsets color to term's fg color

  # regular colors
# local K="\[\033[0;30m\]"    # black
# local R="\[\033[0;31m\]"    # red
 local G="\[\033[0;32m\]"    # green
# local Y="\[\033[0;33m\]"    # yellow
# local B="\[\033[0;34m\]"    # blue
 local M="\[\033[0;35m\]"    # magenta
# local C="\[\033[0;36m\]"    # cyan
 local W="\[\033[0;37m\]"    # white

 #  # emphasized (bolded) colors
 # local EMK="\[\033[1;30m\]"
 # local EMR="\[\033[1;31m\]"
 # local EMG="\[\033[1;32m\]"
 # local EMY="\[\033[1;33m\]"
 # local EMB="\[\033[1;34m\]"
 # local EMM="\[\033[1;35m\]"
 # local EMC="\[\033[1;36m\]"
 # local EMW="\[\033[1;37m\]"

 #  # background colors
 # local BGK="\[\033[40m\]"
 # local BGR="\[\033[41m\]"
 # local BGG="\[\033[42m\]"
 # local BGY="\[\033[43m\]"
 # local BGB="\[\033[44m\]"
 # local BGM="\[\033[45m\]"
 # local BGC="\[\033[46m\]"
 # local BGW="\[\033[47m\]"

 export PS1="$G\$(__my_rvm_ruby_version)$NONE- $W\T\$(parse_git_status)\$(parse_git_branch) $NONE- $M\W/$NONE\n🃏 "
}
bash_prompt

