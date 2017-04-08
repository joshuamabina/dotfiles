#!/usr/bin/env bash

# Copyright (c) 2013 Embark Mobile
# Licensed under the MIT License.
# https://github.com/embarkmobile/android-sdk-installer

# Constants
SDK_FILE=android-sdk_r22.3-linux.tgz
SDK_URL=http://dl.google.com/android/$SDK_FILE
DEFAULT_INSTALL=platform-tools
WAIT_FOR_EMULATOR_URL=https://github.com/embarkmobile/android-sdk-installer/raw/version-1/wait_for_emulator

# Defaults
INSTALLER_DIR=$HOME/.android-sdk-installer
INSTALL=""

for i in "$@"
do
case $i in
    --dir=*)
    INSTALLER_DIR=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    ;;
    --install=*)
    INSTALL=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    ;;
    *)
    # unknown option
    ;;
esac
done

# Expand the path
INSTALLER_DIR=`readlink -f "$INSTALLER_DIR"`

TOOLS_DIR=$INSTALLER_DIR/tools

echo "Installing SDK in $INSTALLER_DIR"

mkdir -p $INSTALLER_DIR
mkdir -p $TOOLS_DIR

echo "Downloading SDK"
wget -c -O $INSTALLER_DIR/$SDK_FILE $SDK_URL
echo "Extracting SDK"
tar xzf $INSTALLER_DIR/$SDK_FILE --directory $INSTALLER_DIR

export ANDROID_HOME=$INSTALLER_DIR/android-sdk-linux

# Download wait_for_emulator script
wget -q -O $TOOLS_DIR/wait_for_emulator $WAIT_FOR_EMULATOR_URL
chmod +x $TOOLS_DIR/wait_for_emulator


# Setup environment file
echo "export ANDROID_HOME=$ANDROID_HOME" > $INSTALLER_DIR/env
echo "export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$TOOLS_DIR:\$PATH" >> $INSTALLER_DIR/env

# Install components
ALL_INSTALL=$DEFAULT_INSTALL,$INSTALL

echo "Installing $ALL_INSTALL"
echo y | $ANDROID_HOME/tools/android update sdk --no-ui -a --filter $ALL_INSTALL