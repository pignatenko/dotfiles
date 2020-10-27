bindkey -e

HISTFILE="$ZDOTDIR/history"
HISTSIZE=100000
SAVEHIST=100000

# Add commands to history as they are entered, don't wait for shell to exit and
# import them
setopt SHARE_HISTORY
# Also remember command start time and duration
setopt EXTENDED_HISTORY
# Do not keep duplicate commands in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
# Do not remember commands that start with a whitespace
setopt HIST_IGNORE_SPACE
# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS

# Auto CD when typing dir name
setopt AUTO_CD
# Make cd push the old directory onto the directory stack.
setopt AUTO_PUSHD
# Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify a directory in the stack.
setopt PUSHD_MINUS
# Don't squak
setopt PUSHD_SILENT
# Have pushd with no arguments act like ‘pushd $HOME’.
setopt PUSHD_TO_HOME
# Extended globs
setopt EXTENDEDGLOB

declare -a chpwd_functions

disable_alias() {
  function alias() {}
}

enable_alias() {
  unfunction alias
}

silent() {
  "$@" &> /dev/null
}
