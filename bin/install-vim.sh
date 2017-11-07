#!/usr/bin/env bash

##
#Compile and install latest stable vim
#
#Contact mabinajoshua-at-gmail-dot-com
##

#Prerequisites
sudo apt-get install libncurses5-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git

##When you want to build a program from source and it fails due to missing headers.
##Auto-apt can search what package would provide the header files.
##https://help.ubuntu.com/community/AutoApt
sudo apt-get install auto-apt

##CheckInstall keeps track of all the files created or modified by your installation script,
##builds a standard binary package (.deb, .rpm, .tgz) and
##installs it in your system giving you the ability to uninstall it
##with your distribution's standard package management utilities.
##See https://wiki.debian.org/CheckInstall

#Remove vim if you have it already.
sudo apt-get remove --purge vim \
	vim-runtime \
	gvim \
	vim-tiny \
	vim-common \
	vim-gui-common \
	vim-nox

cd /tmp

git clone git@github.com:vim/vim.git --depth=1 2> /dev/null

cd vim

make distclean

sudo auto-apt run ./configure \
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

sudo checkinstall \
&& apt-get autoremove \
&& sudo apt-get autoclean \
&& sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1 \
&& sudo update-alternatives --set editor /usr/local/bin/vim \
&& sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1 \
&& sudo update-alternatives --set vi /usr/local/bin/vim

which vim && vim --version
