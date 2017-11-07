#!/usr/bin/env bash

##
#Compile and install latest stable vim
#
#Contact mabinajoshua-at-gmail-dot-com
##

sudo -v

#prerequisite libraries
apt-get install libncurses5-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git
    
#remove vim if you have it already.
apt-get remove --purge vim \
	vim-runtime \
	gvim \
	vim-tiny \
	vim-common \
	vim-gui-common
	vim-nox

cd /tmp

git clone git@github.com:vim/vim.git --depth=1 \
	&& cd vim

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
	--disable-sysmouse

make

make install

vim --version

mkdir -p ~/.vim && \
	git clone git@github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
