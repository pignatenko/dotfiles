#- conflicts_all () {
#   perl -0777 -i -p -e 's/<{5,}.*\n((?:.|\n)*)(?:\n\|{5,}(?:.|\n)*)\n?={5,}\n((?:.|\n)*)\n>{5,}.*\n?/\1\n\2/gm' "$@"
# }

# conflicts_ours () {
#   perl -0777 -i -p -e 's/<{5,}.*\n((?:.|\n)*)(?:\n\|{5,}(?:.|\n)*)\n?={5,}\n((?:.|\n)*)\n>{5,}.*\n?/\1/gm' "$@"
# }

# conflicts_theirs () {
#   perl -0777 -i -p -e 's/<{5,}.*\n((?:.|\n)*)(?:\n\|{5,}(?:.|\n)*)\n?={5,}\n((?:.|\n)*)\n>{5,}.*\n?/\2/gm' "$@"
# }

CONTEXT='(?:\n.*){0,5}?'
HEAD='^<{5,}.*'
OURS='((?:\n.*)*?)'
COMMON_HEAD='(?:\n\|{5,}.*)'
COMMON_BODY='(?:(?:\n.*)*?)'
COMMON="(?:${COMMON_HEAD}${COMMON_BODY})?"
DIVIDE='(?:\n\={5,})'
THEIRS='((?:\n.*)*?)'
END='\n>{5,}.*'
SEARCH_REGEX="(${HEAD}${OURS}${COMMON}${DIVIDE}${THEIRS}${END})"
REPLACE_ALL='\2\n\3'
REPLACE_OURS='\2'
REPLACE_THEIRS='\3'
CONTEXT_REGEX="(${CONTEXT}${HEAD}${OURS}${COMMON}${DIVIDE}${THEIRS}${END}${CONTEXT})"

conflicts_resolve_first_all () {
  perl -0777 -i -p -e "s/${SEARCH_REGEX}/${REPLACE_ALL}/m" "$@"
}

conflicts_resolve_first_ours () {
  perl -0777 -i -p -e "s/${SEARCH_REGEX}/${REPLACE_OURS}/m" "$@"
}

conflicts_resolve_first_theirs () {
  printf "%s\n\n" "s/${SEARCH_REGEX}/${REPLACE_THEIRS}/m"
  perl -0777 -i -p -e "s/${SEARCH_REGEX}/${REPLACE_THEIRS}/m" "$@"
}

conflicts_show_all () {
  PRINT='print "\n-------------------------------------------------------------------------\n$1\n";'
  perl -0777 -ne "while ( /${CONTEXT_REGEX}/gm ) {${PRINT}}" "$@"
}

conflicts_show_first_debug () {
  PRINT='print "\nFULL: $1\n OURS:$2 \n THEIRS: $3\n"'
  printf '%s\n' ${SEARCH_REGEX}
  perl -0777 -ne "(/${SEARCH_REGEX}/m && ${PRINT}) || exit 1; " "$1"
}

conflicts_show_first () {
  # PRINT='print "$1\n $.\n"'
  ORIGINAL_FROM=`egrep "<{5,}" -n -m1 "$1" | cut -d ':' -f1`
  ORIGINAL_TO=`egrep ">{5,}" -n -m1  "$1"| cut -d ':' -f1`
  if  [[ -z $ORIGINAL_FROM ]]; then
    return 1;
  fi

  if  [[ -z $ORIGINAL_TO ]]; then
    return 1;
  fi

  (( FROM=$ORIGINAL_FROM-5 ))
  (( TO=$ORIGINAL_TO+5 ))

  if (( $FROM < 0 )); then
    FROM=0
  fi

  bat -r "${FROM}:${TO}" $1
  # perl -0777 -ne "(/${CONTEXT_REGEX}/m && ${PRINT}) || exit 1; " "$1" | bat #--language="${1##*.}"
}

conflicts_resolve_all () {
  perl -0777 -i -p -e "s/${SEARCH_REGEX}/${REPLACE_ALL}/gm" "$@"
}

conflicts_resolve_ours () {
  perl -0777 -i -p -e "s/${SEARCH_REGEX}/${REPLACE_OURS}/gm" "$@"
}

conflicts_resolve_theirs () {
  perl -0777 -i -p -e "s/${SEARCH_REGEX}/${REPLACE_THEIRS}/gm" "$@"
}

conflicts_get_resolve_input() {
  input=''
  vared -p 'What would you like to do? (all/ours/theirs/edit/a/o/t/e/exit): ' -c input

  if [[ "$input" == 'edit' ]]; then
    nvim -f -c "Gvdiffsplit!" "$@"
  elif [[ "$input" == 'e' ]]; then
    nvim -f -c "Gvdiffsplit!" "$@"
  elif [[ "$input" == 'all' ]]; then
    conflicts_resolve_first_all "$@"
  elif [[ "$input" == 'a' ]]; then
    conflicts_resolve_first_all "$@"
  elif [[ "$input" == 'ours' ]]; then
    conflicts_resolve_first_ours "$@"
  elif [[ "$input" == 'o' ]]; then
    conflicts_resolve_first_ours "$@"
  elif [[ "$input" == 'theirs' ]]; then
    conflicts_resolve_first_theirs "$@"
  elif [[ "$input" == 't' ]]; then
    conflicts_resolve_first_theirs "$@"
  elif [[ "$input" == 'exit' ]]; then
    return 1;
  else
    conflicts_get_resolve_input "$@"
  fi

}

conflicts_resolve() {
  EXIT=0
  for arg; do
    if ! [[ -f "$arg" ]]; then
      echo "$arg does not exist";
      EXIT=1
    fi
  done

  [[ EXIT == 1 ]] && exit 1;

  for arg; do
    while conflicts_show_first "$arg"; do
      conflicts_get_resolve_input "$arg"
      if (( $? > 0 )); then
        return 1;
      fi
    done
  done
}
