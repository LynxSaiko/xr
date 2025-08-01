#!/bin/bash
wget https://webkitgtk.org/releases/webkitgtk-2.48.3.tar.xz
tar -xf webkitgtk-2.48.3.tar.xz
cd webkitgtk-2.48.3
mkdir -vp build &&
cd        build &&

cmake -D CMAKE_BUILD_TYPE=Release     \
      -D CMAKE_INSTALL_PREFIX=/usr    \
      -D CMAKE_SKIP_INSTALL_RPATH=ON  \
      -D PORT=GTK                     \
      -D LIB_INSTALL_DIR=/usr/lib     \
      -D USE_LIBBACKTRACE=OFF         \
      -D USE_LIBHYPHEN=OFF            \
      -D ENABLE_X11_TARGET=ON         \
      -D ENABLE_WAYLAND_TARGET=OFF    \
      -D ENABLE_GAMEPAD=OFF           \
      -D ENABLE_MINIBROWSER=OFF       \
      -D ENABLE_DOCUMENTATION=OFF     \
      -D ENABLE_WEBDRIVER=OFF         \
      -D ENABLE_WEBGL=OFF             \
      -D USE_WOFF2=OFF                \
      -D USE_GTK4=OFF                 \
      -D ENABLE_JOURNALD_LOG=OFF      \
      -D ENABLE_BUBBLEWRAP_SANDBOX=OFF \
      -D USE_SYSPROF_CAPTURE=NO       \
      -D ENABLE_SPEECH_SYNTHESIS=OFF  \
      -D USE_GSTREAMER_TRANSCODER=OFF \
      -W no-dev -G Ninja ..           &&
ninja -j$(nproc)
ninja install

