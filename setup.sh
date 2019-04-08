#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
echo $SCRIPT_DIR

shopt -s nullglob
shopt -s extglob

cd $SCRIPT_DIR
while read -d $'\0' file;
do
    file=$(basename $file)
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".gitmodules" ]] && continue
    [[ "$file" == ".gitignore" ]] && continue
    [[ "$file" == ".gitconfig" ]] && continue
    [[ "$file" == "setup.sh" ]] && continue
    [[ "$file" == "config" ]] && continue
    echo $SCRIPT_DIR/$file
    ln -snb $SCRIPT_DIR/$file ~/$file
done <  <(find . -mindepth 1 -maxdepth 1 -name "*" -print0)

while read -d $'\0' file;
do
    file=$(basename $file)
    echo $SCRIPT_DIR/config/$file
    ln -snb $SCRIPT_DIR/config/$file ~/.config/$file
done <  <(find config -mindepth 1 -maxdepth 1 -name "*" -print0)

#for rcfile in submodules/prezto/runcoms/!(README.md); do
#  ln -s $SCRIPT_DIR/$rcfile ~/.${rcfile##*/}
#  echo $SCRIPT_DIR/$rcfile ~/.${rcfile##*/}
#done
#ln -s $SCRIPT_DIR/submodules/prezto/ ~/.zprezto
#echo $SCRIPT_DIR/submodules/prezto/ ~/.zprezto
