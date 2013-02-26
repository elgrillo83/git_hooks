#!/bin/bash
## START PRECOMMIT HOOK

files_modified=`git status --porcelain | egrep "^(A |M |R ).*" | awk ' { if ($3 == "->") print $4; else print $2 } '`

[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"
## use ruby defined in project
source .rvmrc

for f in $files_modified; do
  echo "Checking ${f}..."
  if [[ $f == *.rb ]]; then
    ruby -c $f
    if [ $? != 0 ]; then
      echo "File ${f} failed"
      exit 1
    fi
    if grep --color -n "binding.pry" $f; then
      echo "File ${f} failed - found 'binding.pry'"
      exit 1
    fi
  elif [[ $f == *.haml ]]; then
    bundle exec haml --check $f
  elif [[ $f == *.sass ]]; then
    bundle exec sass --check $f
  fi
  if [ $? != 0 ]; then
    echo "File ${f} failed"
    exit 1
  fi
done
exit
## END PRECOMMIT HOOK
