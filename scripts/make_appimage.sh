#!/bin/sh

cd SameBoy-0.15.8

# Download linuxdeploy and appimagetool

wget -q "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage"
wget -q "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"

chmod +x linuxdeploy-x86_64.AppImage appimagetool-x86_64.AppImage

# Run linuxdeploy

./linuxdeploy-x86_64.AppImage -i AppDir/usr/share/icons/hicolor/512x512/apps/sameboy.png \
		-d FreeDesktop/sameboy.desktop \
		--executable AppDir/usr/bin/sameboy \
		--appdir AppDir

# Pack appdir

cp -r AppDir SameBoy

tar -cf SameBoy-0.15.8.tar SameBoy 

gzip -9 Sameboy-0.15.8.tar

# Build appimage

export APPIMAGETOOL_APP_NAME="SameBoy-0.15.8-x86_64.AppImage"

./appimagetool-x86_64.AppImage -u "gh-releases-zsync|DarkSamus669|sameboy-appimage|SameBoy-*x86_64.AppImage" AppDir

