#!/bin/bash
wget https://storage.googleapis.com/aom-releases/libaom-3.12.1.tar.gz
tar -xf libaom-3.12.1.tar.gz
cd libaom-3.12.1
mkdir aom-build &&
cd    aom-build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D BUILD_SHARED_LIBS=1       \
      -D ENABLE_DOCS=no            \
      -G Ninja .. &&
ninja -j$(nproc)
ninja install &&
rm -v /usr/lib/libaom.a
echo "Selesai"



wget https://github.com/AOMediaCodec/libavif/archive/v1.3.0/libavif-1.3.0.tar.gz
tar -xf libavif-1.3.0.tar.gz
cd libavif-1.3.0
mkdir build &&
cd    build &&

cmake -D CMAKE_INSTALL_PREFIX=/usr \
      -D CMAKE_BUILD_TYPE=Release  \
      -D AVIF_CODEC_AOM=SYSTEM     \
      -D AVIF_BUILD_GDK_PIXBUF=ON  \
      -D AVIF_LIBYUV=OFF           \
      -G Ninja .. &&
ninja -j$(nproc)
cmake .. -D AVIF_GTEST=LOCAL -D AVIF_BUILD_TESTS=ON &&
ninja && ninja test
ninja install
gdk-pixbuf-query-loaders --update-cache
