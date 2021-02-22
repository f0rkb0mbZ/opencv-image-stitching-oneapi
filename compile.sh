#!/usr/bin/env bash
export PKG_CONFIG_PATH="/home/u59912/opencv-bin/lib/pkgconfig:$PKG_CONFIG_PATH"

echo "OpenCV Version:"
pkg-config --modversion opencv4

dpcpp stitch.cpp -o stitch `pkg-config --cflags --libs opencv4`

echo "Compilation Finished!"
