#!/bin/sh

# Download rgbds source
wget -q "https://github.com/gbdev/rgbds/releases/download/v0.6.1/rgbds-0.6.1.tar.gz" \
     -O rgbds.tar.gz

# Extract rgbds source
tar -xf rgbds.tar.gz

# Build rgbds

cd rgbds

make -j`nproc` && sudo make install

# Download sameboy source

cd ..

wget -q "https://github.com/LIJI32/SameBoy/archive/refs/tags/v0.15.8.tar.gz" \
     -O sameboy.tar.gz

# Extract sameboy source
tar -xf sameboy.tar.gz

# Build sameboy

cd SameBoy-0.15.8

make -j`nproc` CONF=release

make install PREFIX=AppDir/usr
