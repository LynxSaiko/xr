#!/bin/bash
wget https://download.gnome.org/sources/glib-networking/2.80/glib-networking-2.80.1.tar.xz
tar -xf glib-networking-2.80.1.tar.xz
cd glib-networking-2.80.1
mkdir build &&
cd    build &&

meson setup             \
   --prefix=/usr        \
   --buildtype=release  \
   -D libproxy=disabled \
   .. &&
ninja -j$(nproc)
ninja install
