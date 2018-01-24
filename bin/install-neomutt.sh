#!/usr/bin/env bash

sudo apt-get install -y libnotmuch3 libnotmuch-dev

cd /tmp

git clone https://github.com/neomutt/neomutt --depth=1 \
 && cd neomutt \
 && ./configure --prefix=/usr/local \
		--disable-nls \
		--disable-pop \
		--disable-dependency-tracking \
		--enable-debug \
		--enable-fcntl \
		--enable-hcache \
		--enable-imap \
		--enable-locales-fix \
		--enable-nntp \
		--enable-sidebar \
		--with-docdir=/usr/local/share/neomutt \
		--with-ui=ncurses
		--with-mixmaster \
		--with-ncurses \
		--with-gss \
		--with-gnutls \
		--without-idn \
		--with-included-gettext \
		--with-idn \
		--with-regex \
		--notmuch
		--with-notmuch=
		--ssl \
&& make \
&& sudo make install
