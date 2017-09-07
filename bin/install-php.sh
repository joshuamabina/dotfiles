#!/bin/env bash

sudo -v

# Clean up!
#sudo apt-get remove --purge php7.0*
#sudo apt-get autoremove

# Dependencies
#sudo apt-get update
#sudo apt-get install -y \
    #build-essential \
    #pkg-config \
    #git-core \
    #autoconf \
    #bison \
    #libxml2-dev \
    #libbz2-dev \
    #libmcrypt-dev \
    #libicu-dev \
    #libssl-dev \
    #libcurl4-openssl-dev \
    #libltdl-dev \
    #libjpeg-dev \
    #libpng-dev \
    #libpspell-dev \
    #libreadline-dev

cd /tmp

# Get the latest PHP source
#git clone -b 'php-7.1.9' --single-branch --depth=1 https://github.com/php/php-src.git

cd ./php-src

./buildconf --force

CONFIGURE_STRING="--prefix=/usr/local/src/php7 \
                  --enable-huge-code-pages \
                  --with-config-file-scan-dir=/usr/local/src/php7/etc/conf.d \
                  --without-pear \
                  --enable-bcmath \
                  --with-bz2 \
                  --enable-calendar \
                  --enable-intl \
                  --enable-exif \
                  --enable-dba \
                  --enable-ftp \
                  --with-gettext \
                  --with-gd \
                  --with-jpeg-dir \
                  --enable-mbstring \
                  --with-mcrypt \
                  --with-mhash \
                  --enable-mysqlnd \
                  --with-mysql=mysqlnd \
                  --with-mysql-sock=/var/run/mysqld/mysqld.sock \
                  --with-mysqli=mysqlnd \
                  --with-pdo-mysql=mysqlnd \
                  --with-openssl \
                  --enable-pcntl \
                  --with-pspell \
                  --enable-shmop \
                  --enable-soap \
                  --enable-sockets \
                  --enable-sysvmsg \
                  --enable-sysvsem \
                  --enable-sysvshm \
                  --enable-wddx \
                  --with-zlib \
                  --enable-zip \
                  --with-readline \
                  --with-curl \
                  --enable-fpm \
                  --with-fpm-user=www-data \
                  --with-fpm-group=www-data"

./configure $CONFIGURE_STRING

make -j `cat /proc/cpuinfo | grep processor | wc -l`

sudo make install

# Create a dir for storing PHP module conf
sudo mkdir -p /usr/local/src/php7/etc/conf.d

# Symlink php-fpm to php7-fpm
sudo ln -sf /usr/local/src/php7/sbin/php-fpm /usr/local/src/php7/sbin/php7-fpm

# Add config files
sudo cp /tmp/php-src/php.ini-production /usr/local/src/php7/lib/php.ini
sudo cp ~/dotfiles/templates/php-www.conf /usr/local/src/php7/etc/php-fpm.d/www.conf
sudo cp ~/dotfiles/templates/php-fpm.conf /usr/local/src/php7/etc/php-fpm.conf
sudo cp ~/dotfiles/templates/php-modules.ini /usr/local/src/php7/etc/conf.d/modules.ini

# Add the init script
sudo cp ~/dotfiles/templates/php-fpm.init /etc/init.d/php7-fpm
sudo chmod +x /etc/init.d/php7-fpm
sudo update-rc.d php7-fpm defaults

sudo service php7-fpm start
