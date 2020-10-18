EDITOR_SET=$(false)

if which nvr &> /dev/null && [ -f "$NVIM_LISTEN_ADDRESS" ]; then
  export VISUAL='nvr';
  export EDITOR='nvr';
  EDITOR_SET=$(true)
elif which nvim &> /dev/null; then
  export VISUAL='nvim';
  export EDITOR='nvim';
  EDITOR_SET=$(true)
elif which vim &> /dev/null; then
  export VISUAL='vim';
  export EDITOR='vim';
  EDITOR_SET=$(true)
elif which vi &> /dev/null; then
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

