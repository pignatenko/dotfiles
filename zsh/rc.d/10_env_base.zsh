UNAME_STRING=$(uname -s)

if [[ "$UNAME_STRING" == "Darwin" ]]; then
 export OPERATING_SYSTEM='Darwin';
elif [[ "$(expr substr ${UNAME_STRING} 1 5)" == "Linux" ]]; then
  export OPERATING_SYSTEM='Linux';
elif [[ "$(expr substr ${UNAME_STRING} 1 10)" == "MINGW32_NT" ]]; then
  export OPERATING_SYSTEM='Windows';
elif [[ "$(expr substr ${UNAME_STRING} -s) 1 10)" == "MINGW64_NT" ]]; then
  export OPERATING_SYSTEM='Windows';
else
  export OPERATING_SYSTEM='Unknown';
fi

export FZF_DEFAULT_COMMAND="rg --files"
export PATH="$HOME/bin:$PATH"
export PATH="$ZDOTDIR/bin:$PATH"
