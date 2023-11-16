#!/bin/sh

# Download source
wget -q "https://github.com/LIJI32/SameBoy/archive/refs/tags/v0.15.8.tar.gz" \
	 -O sameboy.tar.gz

# Extract source
tar -xf sameboy.tar.gz

# Build sameboy

cd SameBoy-0.15.8

make -j`nproc` CONF=release

make install DESTDIR=AppDir PREFIX=usr
