#!/usr/bin/env bash

bfVersion=10.9.0
nwArmVersion=nw60-arm64_2022-01-08
LINUX_INSTALL_DIR=/opt/betaflight
metadata_name=betaflight-configurator

wget -q -c https://github.com/betaflight/betaflight-configurator/releases/download/${bfVersion}/betaflight-configurator_${bfVersion}_linux64-portable.zip
unzip -qq betaflight-configurator_${bfVersion}_linux64-portable.zip

wget -q https://github.com/LeonardLaszlo/nw.js-armv7-binaries/releases/download/${nwArmVersion}/${nwArmVersion}.tar.gz
tar -xvf ${nwArmVersion}.tar.gz usr/docker/dist/nwjs-chromium-ffmpeg-branding/nwjs-v0.60.1-linux-arm64.tar.gz
tar -xvf ./usr/docker/dist/nwjs-chromium-ffmpeg-branding/nwjs-v0.60.1-linux-arm64.tar.gz
cp -R ./nwjs-v0.60.1-linux-arm64/* ./'Betaflight Configurator'/

rm -rf ${LINUX_INSTALL_DIR}/${metadata_name}
mv ./'Betaflight Configurator'/ ${LINUX_INSTALL_DIR}/${metadata_name}
chown root:root ${LINUX_INSTALL_DIR}
chown -R root:root ${LINUX_INSTALL_DIR}/${metadata_name}
cp ${LINUX_INSTALL_DIR}/${metadata_name}/${metadata_name}.desktop /usr/share/applications/
chmod +xr ${LINUX_INSTALL_DIR}/${metadata_name}/chrome_crashpad_handler
chmod +xr ${LINUX_INSTALL_DIR}/${metadata_name}/${metadata_name}
chmod -R +Xr ${LINUX_INSTALL_DIR}/${metadata_name}/
