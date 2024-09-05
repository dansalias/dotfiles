#!/bin/bash

while getopts ":v" opt; do
  case $opt in
    v)
      export VERBOSE=true
      shift
      ;;
  esac
done

__help () {
  cat << EOF
Usage: ./ln.sh [-v] <command>

  Commands:
    clean  - remove all links
    link   - (re)create links
    list   - show all links
    update - add/remove links from last git commit

  Options:
    -v     - verbose (show creating/removing links)

EOF
}

__sudo () {
  [ -w $(dirname $1) ] || echo "sudo"
}
export -f __sudo

__ln () {
  if [[ $(readlink $2) != $1 ]]; then
    [[ $VERBOSE = true ]] && echo "creating $2"
    $(__sudo $2) mkdir -p $(dirname $2)
    $(__sudo $2) ln -sf $1 $2
  fi
}
export -f __ln

__rm () {
  [[ $VERBOSE = true ]] && echo "removing $1"
  $(__sudo $1) rm -f $1
}
export -f __rm

__show () {
  echo -e "$( \
    [[ $(readlink $2) = $1 ]] \
      && echo "\033[32m✓" \
      || echo "\033[31m✗" \
    ) $2 -> $1 \033[0m \
  " \
  | sed "s|$HOME|~|g"
}
export -f __show

__ls () {
  find $(dirname $0) \
    -type f ! -path '*.git/*' \
    | xargs -I {} awk 'NR == 1 && $2 == "ln" { print FILENAME " " $3 }' {} \
    | sed "s|^./|$(pwd)/|;s|~|$HOME|"
}

clean () {
  __ls | awk '{system("__rm " $2)}'
}

link () {
  __ls | awk '{system("__ln " $1 " " $2)}'
}

list () {
  __ls | awk '{system("__show " $1 " " $2)}' | column -t -o " "
}

update () {
  git diff HEAD~ | awk '/\-\S*\s+ln/ {
    if(prevLine ~ /@@ -1/) {
      system("__rm " $3)
    }
  } { prevLine=$0 }'

  link
}

if [[ $(type -t $1) == function ]]; then
  $1
else
  __help
  exit 1
fi
