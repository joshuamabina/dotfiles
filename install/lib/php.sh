#!/usr/bin/env bash

# Deprecated

## pre-requisites
sudo apt-get install apt-transport-https ca-certificates

sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

sudo sh -c 'echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list'

sudo apt-get update

#---

## install latest stable php

VERSION='7.2'

sudo apt-get install php${VERSION}-fpm \
	php${VERSION}-cli \
	php${VERSION}-common \
	php${VERSION}-json \
	php${VERSION}-opcache \
	php${VERSION}-mysql \
	php${VERSION}-sqlite3 \
	php${VERSION}-phpdbg \
	php${VERSION}-mbstring \
	php${VERSION}-gd \
	php${VERSION}-imap \
	php${VERSION}-ldap \
	php${VERSION}-pgsql \
	php${VERSION}-pspell \
	php${VERSION}-recode \
	php${VERSION}-readline \
	php${VERSION}-snmp \
	php${VERSION}-tidy \
	php${VERSION}-dev \
	php${VERSION}-intl \
	php${VERSION}-curl \
	php${VERSION}-zip \
	php${VERSION}-bz2 \
	php${VERSION}-xml

sudo apt-get install php-imagick -y

sudo apt-get autoremove
sudo apt-get autoclean

which php && php --version
