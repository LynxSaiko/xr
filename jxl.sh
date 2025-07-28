#!/bin/bash
wget https://github.com/libjxl/libjxl/archive/v0.11.1/libjxl-0.11.1.tar.gz
tar -xf libjxl-0.11.1.tar.gz
cd libjxl-0.11.1
mkdir build &&
cd    build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr             \
      -D CMAKE_BUILD_TYPE=Release              \
      -D BUILD_TESTING=OFF                     \
      -D BUILD_SHARED_LIBS=ON                  \
      -D JPEGXL_ENABLE_SKCMS=OFF               \
      -D JPEGXL_ENABLE_SJPEG=OFF               \
      -D JPEGXL_ENABLE_PLUGINS=ON              \
      -D JPEGXL_INSTALL_JARDIR=/usr/share/java \
      -G Ninja ..                              &&
ninja -j$(nproc)
ninja install
gdk-pixbuf-query-loaders --update-cache
