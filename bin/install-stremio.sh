#!/usr/bin/env bash

#Download and install Strem.io
#http://strem.io

STREM_DL="https://dl.strem.io/linux/v4.0.2/Stremio+4.0.2.appimage"
STREM_IO="/usr/local/bin/stremio"

STREM_DIR="/etc/Stremio"
STREM_IMG="${STREM_DIR}/Stremio-runtime"

#sudo mkdir -p ${STREM_DIR}

#sudo wget -O ${STREM_IMG} ${STREM_DL}

sudo chmod +x ${STREM_IMG}
sudo ln -fs ${STREM_IMG} ${STREM_IO}

echo ${STREM_DIR}
echo ${STREM_IMG}
