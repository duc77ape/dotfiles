#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
for file in .??*
do
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".gitmodules" ]] && continue
    [[ "$file" == ".gitignore" ]] && continue
    [[ "$file" == ".gitconfig" ]] && continue
    echo $SCRIPT_DIR/$file
    ln -snf $SCRIPT_DIR/$file ~/$file
done
