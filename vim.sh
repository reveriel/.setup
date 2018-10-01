#!/bin/sh

if [ -d ~/.vim_runtime ]
then
    cp -f ./my_configs.vim ~/.vim_runtime
else
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
    cp ./my_configs.vim ~/.vim_runtime/
fi



