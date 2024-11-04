#!/bin/bash
echo "installing stremio dependencies..."
sudo apt install nodejs libmpv1 qml-module-qt-labs-platform qml-module-qtquick-controls qml-module-qtquick-dialogs qml-module-qtwebchannel qml-module-qtwebengine qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings librubberband2

echo "installing strem.io..."
wget "https://dl.strem.io/shell-linux/v4.4.116/stremio_4.4.116-1_amd64.deb"

sudo dpkg -i stremio_4.4.116-1_amd64.deb

wget "http://archive.ubuntu.com/ubuntu/pool/universe/x/x264/libx264-152_0.152.2854+gite9a5903-2_amd64.deb"
sudo dpkg -i libx264-152_0.152.2854+gite9a5903-2_amd64.deb

echo "stremio successfully installed."
