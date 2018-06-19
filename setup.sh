#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

shopt -s nullglob
shopt -s extglob

for file in .??*
do
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".gitmodules" ]] && continue
    [[ "$file" == ".gitignore" ]] && continue
    [[ "$file" == ".gitconfig" ]] && continue
    echo $SCRIPT_DIR/$file
    ln -snf $SCRIPT_DIR/$file ~/$file
done

for rcfile in submodules/prezto/runcoms/!(README.md); do
  ln -s $SCRIPT_DIR/$rcfile ~/.${rcfile##*/}
done
ln -s $SCRIPT_DIR/submodules/prezto/ ~/.zprezto
