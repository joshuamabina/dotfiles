#!/usr/bin/env bash

cd "$HOME/toolkit"

git clone git@github.com:vim/vim.git --depth=1

./configure \
--with-features=huge \
--enable-python3interp \
--enable-pythoninterp \
--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ \
--enable-rubyinterp \
--enable-luainterp \
--enable-perlinterp \
--with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu/ \
--enable-gui=no \
--enable-multibyte \
--enable-fontset \
--enable-cscope \
--disable-sysmouse \
--with-compiledby="Joshua Mabina <joshuamabina.github.io>" 

make

sudo make install

mkdir ~/.vim && \
	git clone git@github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# TODO: vim -e +PluginInstall 
