#!/bin/env bash

# Dependencies
#sudo apt-get update
#sudo apt-get install -y \
    #imagemagick \
    #libmagickwand-dev

cd /tmp
#git clone https://github.com/mkoppanen/imagick.git --depth=1
cd imagick

/usr/local/src/php7/bin/phpize

CONFIGURE_STRING="--prefix=/usr/local/src/php7 \
                  --with-php-config=/usr/local/src/php7/bin/php-config"

./configure $CONFIGURE_STRING

make
sudo make install

# Add config files
echo "extension=imagick.so" | sudo tee -a /usr/local/src/php7/etc/conf.d/modules.ini
