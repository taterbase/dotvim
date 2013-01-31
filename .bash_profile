export NODE_ENV=local

source ~/git-completion.bash
source ~/.rvm/scripts/rvm

#showing git branches in bash prompt
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
function init {
  local          RED="\[\033[0;31m\]"
  local    LIGHT_RED="\[\033[1;31m\]"
  local       YELLOW="\[\033[0;33m\]"
  local  LIGHT_GREEN="\[\033[1;32m\]"
  local        WHITE="\[\033[1;37m\]"
  local   LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_PURPLE="\[\033[1;34m\]"
  local   LIGHT_BLUE="\[\033[0;36m\]"

  PS1="$LIGHT_RED\W$YELLOW\$(parse_git_branch) $LIGHT_PURPLE> $LIGHT_GRAY"
}

init


. ~/.nvm/nvm.sh
nvm use v0.8.18

ulimit -n 10000

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
