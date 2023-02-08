#!/usr/bin/env bash

wget -q -c https://github.com/betaflight/betaflight-configurator/releases/download/10.9.0/betaflight-configurator_10.9.0_linux64-portable.zip -O betaflight-configurator_linux64-portable.zip

unzip -qq betaflight-configurator_linux64-portable.zip

mv 'Betaflight Configurator' 'Betaflight-Configurator'

nwArmVersion = nw60-arm64_2022-01-08
wget -q https://github.com/LeonardLaszlo/nw.js-armv7-binaries/releases/download/$nwArmVersion/$nwArmVersion.tar.gz

tar -xvf nw60-arm64_2022-01-08.tar.gz usr/docker/dist/nwjs-chromium-ffmpeg-branding/nwjs-v0.60.1-linux-arm64.tar.gz
tar -xvf ./usr/docker/dist/nwjs-chromium-ffmpeg-branding/nwjs-v0.60.1-linux-arm64.tar.gz
cd nwjs-v0.60.1-linux-arm64/
cp -R * ../Betaflight-Configurator/

LINUX_INSTALL_DIR=/opt/betaflight
metadata_name=betaflight-configurator
rm -rf ${LINUX_INSTALL_DIR}/${metadata_name}
chown root:root ${LINUX_INSTALL_DIR}
chown -R root:root ${LINUX_INSTALL_DIR}/${metadata_name}
# xdg-desktop-menu install ${LINUX_INSTALL_DIR}/${metadata_name}/${metadata_name}.desktop
chmod +xr ${LINUX_INSTALL_DIR}/${metadata_name}/chrome_crashpad_handler
chmod +xr ${LINUX_INSTALL_DIR}/${metadata_name}/${metadata_name}
chmod -R +Xr ${LINUX_INSTALL_DIR}/${metadata_name}/
