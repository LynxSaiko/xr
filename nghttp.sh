#!/bin/bash
wget https://github.com/nghttp2/nghttp2/releases/download/v1.66.0/nghttp2-1.66.0.tar.xz
tar -xf nghttp2-1.66.0.tar.xz
cd nghttp2-1.66.0
./configure --prefix=/usr     \
            --disable-static  \
            --enable-lib-only \
            --docdir=/usr/share/doc/nghttp2-1.66.0 &&
make -j$(nproc)
make install
