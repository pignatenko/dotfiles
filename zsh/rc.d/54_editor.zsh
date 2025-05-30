EDITOR_SET=$(false)

if silent command -v nvim && (( ${+NVIM} )) ; then
  export VISUAL='internal-nvim';
  export EDITOR='internal-nvim';
  EDITOR_SET=$(true)
elif silent command -v nvim; then
  export EDITOR='nvim --listen "$(mktemp -d)/nvim.socket"';
  export VISUAL='nvim --listen "$(mktemp -d)/nvim.socket"';
  EDITOR_SET=$(true)
elif silent command -v vim; then
  export VISUAL='vim';
  export EDITOR='vim';
  EDITOR_SET=$(true)
elif silent command -v vi; then
  export VISUAL='vi';
  export EDITOR='vi';
  EDITOR_SET=$(true)
fi

if [ EDITOR_SET ]; then
  alias v="$EDITOR"
  alias vi="$EDITOR"
  alias vim="$EDITOR"
  alias nvim="$EDITOR"
fi

