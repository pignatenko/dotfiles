autoload -Uz compinit
if  [[ -f "${ZDOTDIR}/.zcompdump" ]] && [ $(date +'%j') != $(stat -f '%Sm' -t '%j' "${ZDOTDIR}/.zcompdump") ]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' completer _complete _correct _approximate 
