#!/bin/sh

# Build rgbds

wget -q "https://github.com/gbdev/rgbds/releases/download/v0.6.1/rgbds-0.6.1.tar.gz" \
     -O rgbds.tar.gz

tar -xf rgbds.tar.gz

cd rgbds

make -j`nproc` && sudo make install

# Build sameboy

cd ..

wget -q "https://github.com/LIJI32/SameBoy/archive/refs/tags/v0.15.8.tar.gz" \
     -O sameboy.tar.gz

tar -xf sameboy.tar.gz

cd SameBoy-0.15.8

make -j`nproc` CONF=release && make install PREFIX=AppDir/usr

cp -r AppDir/usr/share/sameboy/* AppDir/usr/bin

