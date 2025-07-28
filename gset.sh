#!/bin/bash
wget https://download.gnome.org/sources/gsettings-desktop-schemas/48/gsettings-desktop-schemas-48.0.tar.xz
tar -xf gsettings-desktop-schemas-48.0.tar.xz
cd gsettings-desktop-schemas-48.0
sed -i -r 's:"(/system):"/org/gnome\1:g' schemas/*.in &&

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release .. &&
ninja -j$(nproc)
ninja install
