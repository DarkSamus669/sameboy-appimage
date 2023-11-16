#!/bin/sh

cd SameBoy-0.15.8

# Download linuxdeploy

wget -q "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage" \
     -O linuxdeploy-x86_64.AppImage

chmod +x linuxdeploy-x86_64.AppImage

# Building appimage

export ARCH=x86_64
export OUTPUT="SameBoy-0.15.8-x86_64.AppImage"

export UPDATE_INFORMATION="gh-releases-zsync|DarkSamus669|sameboy-appimage|SameBoy-0.15.8-x86_64.AppImage"

./linuxdeploy-x86_64.AppImage -i AppDir/usr/share/icons/hicolor/512x512/apps/sameboy.png \
		-d ../FreeDesktop/sameboy.desktop \
		--executable AppDir/usr/bin/sameboy \
		--appdir AppDir \
        	--output appimage
