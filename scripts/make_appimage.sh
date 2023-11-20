#!/bin/sh

cd SameBoy-0.15.8

# Download linuxdeploy and appimagetool

wget -q "https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage"
wget -q "https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"

chmod +x linuxdeploy-x86_64.AppImage appimagetool-x86_64.AppImage

# Run linuxdeploy

./linuxdeploy-x86_64.AppImage --icon-file "AppDir/usr/share/icons/hicolor/512x512/apps/sameboy.png" \
		                      --desktop-file "FreeDesktop/sameboy.desktop" --appdir AppDir

# Pack appdir

cp -r AppDir SameBoy

tar -cf SameBoy-x86_64.tar SameBoy

gzip -9 SameBoy-x86_64.tar

# Build appimage

./appimagetool-x86_64.AppImage -u "gh-releases-zsync|DarkSamus669|sameboy-appimage|SameBoy-x86_64.AppImage" AppDir
