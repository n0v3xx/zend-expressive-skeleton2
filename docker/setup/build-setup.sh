#!/bin/bash

#install folder
DIR_INSTALL="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUILD_BIN_DIR=$DIR_INSTALL/../../build/bin
BUILD_DIR=$DIR_INSTALL/../../build

# Phing Target : install, deploy, update
PHING_TARGET=install
PHING_TARGET_ENV=docker
# Options
COMPOSER_OPTIONS=--dev

echo "$BUILD_DIR"

#installiere Composer, wenn nicht vorhanden
if [ ! -f $BUILD_BIN_DIR/composer.phar ];
    then
        echo "==> No composer.phar found. Downloading ..."
        curl -sS https://getcomposer.org/installer | php -- --install-dir=$BUILD_BIN_DIR
fi

#mache Composer ausführbar, falls es das nicht schon ist
if [ ! -x $BUILD_BIN_DIR/composer.phar ];
    then
        chmod +x $BUILD_BIN_DIR/composer.phar
fi

#installiere die Abhängigkeiten mit Composer
php -d memory_limit=-1 $BUILD_BIN_DIR/composer.phar install $COMPOSER_OPTIONS

# print PHP Memorylimit
php -r "echo ini_get('memory_limit').PHP_EOL;"

# start phing
#$BUILD_BIN_DIR/phing "$PHING_TARGET" -Dconfig.file="configuration.$PHING_TARGET_ENV.properties.dist"
php $BUILD_BIN_DIR/composer.phar install