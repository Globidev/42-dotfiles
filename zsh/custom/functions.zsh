#!/usr/bin/env bash

make_on_change() {
  setopt null_glob
  files=(**/*.c **/*.h **/*.hpp **/*.cpp Makefile)
  echo "Monitoring: $files" | tr ' ' '\n'
  fswatch -l 0.1 -o $files | xargs -n1 -I _ sh -c "clear; make -j4 && echo 'OK'"
}

gen_makefile() {
    local language=$1
    local executable_name=$2
    sh -c "sed 's/@NAME/$executable_name/g' < ~/.dotfiles/templates/Makefile.$language.template > Makefile"
}
