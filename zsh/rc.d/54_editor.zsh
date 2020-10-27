EDITOR_SET=$(false)

if silent command -v nvr && [[ -n "$NVIM_LISTEN_ADDRESS" ]]; then
  export VISUAL='nvr';
  export EDITOR='nvr';
  EDITOR_SET=$(true)
elif silent command -v nvim; then
  export VISUAL='nvim';
  export EDITOR='nvim';
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

