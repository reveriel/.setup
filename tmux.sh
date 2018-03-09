#!/bin/sh

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

echo "unbind C-q \nset -g prefix C-q \nbind C-q send-prefix\n" >> ~/.tmux.conf.local
