autoload -Uz compinit
autoload -Uz bashcompinit


bashcompinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' completer _complete _correct _approximate 
