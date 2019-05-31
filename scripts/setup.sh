#!/bin/bash

ROOT_DIR=$(cd $(dirname $(dirname $0)); pwd)
cd $ROOT_DIR

shopt -s nullglob
shopt -s extglob

$ Link files under ~
while read -d $'\0' file;
do
    file=$(basename $file)

    # Skip files
    [[ "$file" == ".git" ]] && continue
    [[ "$file" == ".gitmodules" ]] && continue
    [[ "$file" == ".gitignore" ]] && continue
    [[ "$file" == ".gitconfig" ]] && continue
    [[ "$file" == "scripts" ]] && continue
    [[ "$file" == "config" ]] && continue

    echo $ROOT_DIR/$file
    if [ -f ~/$file -a -L ~/$file ]; then
	    mv ~/$file{,.bak} # Back up previous config
    fi
    ln -snf $ROOT_DIR/$file ~/$file 
done <  <(find . -mindepth 1 -maxdepth 1 -name "*" -print0)

# Link files under .config 
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

while read -d $'\0' dir;
do
    dir=$(basename $dir)
    if [ -d ~/.config/$dir -a -L ~/$dir ]; then
        mv ~/.config/$dir{,.bak} # Back up previous config
    fi
done <  <(find config -mindepth 1 -maxdepth 1 -type d -name "*" -print0)
while read -d $'\0' file;
do
    dir=$(dirname $file)
    file=$(basename $file)
    if [ ! -d $dir ]; then
        mkdir -p $dir
    fi
    if [ -f ~/.config/.$dir/$file -a -L ~/.config/.$dir/$file ]; then
        mv ~/.config/.$dir/$file{,.bak} # Back up previous config
    fi
    ln -snf $dir/$file ~/.config/.$dir/$file
done <  <(find config -mindepth 1 -maxdepth 8 -type f -name "*" -print0)

#for rcfile in submodules/prezto/runcoms/!(README.md); do
#  ln -s $SCRIPT_DIR/$rcfile ~/.${rcfile##*/}
#  echo $SCRIPT_DIR/$rcfile ~/.${rcfile##*/}
#done
#ln -s $SCRIPT_DIR/submodules/prezto/ ~/.zprezto
#echo $SCRIPT_DIR/submodules/prezto/ ~/.zprezto