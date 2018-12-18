#!/bin/bash

source common.sh

# if the first time?
if [ -d ~/.vim_runtime ]; then
    INIT=0
else
    INIT=1
fi

SETUP_DIR=$(pwd)
VIMRC_DIR=$SETUP_DIR/submodules/vimrc


# if [ -d ~/.vim_runtime ]
# then
#     cp -f ./my_configs.vim ~/.vim_runtime
# else
#     git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
#     sh ~/.vim_runtime/install_awesome_vimrc.sh
#     cp ./my_configs.vim ~/.vim_runtime/
# fi

function create_vimrc() {
    echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc

}

function init() {
    echo "init"

    local GIT_VERSION=$(git --version | cut -d' ' -f3)

    local F_GIT=""
    if version_ge $GIT_VERSION "2.11.0" ; then
        F_GIT="--progress"
    fi

    git submodule init submodules/vimrc
    git submodule update $F_GIT submodules/vimrc

    cd ~
    ln -s -f $VIMRC_DIR  .vim_runtime
    create_vimrc
}

function update() {
    echo "update"
    cd $VIMRC_DIR
    git sumbodule init
    git submodule update $F_GIT
}

function main() {
    if [ $INIT ]; then
        init
        update
    else
        update
    fi
}

main


