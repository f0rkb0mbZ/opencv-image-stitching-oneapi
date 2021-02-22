#!/usr/bin/env bash
source /opt/intel/inteloneapi/setvars.sh --force
export LD_LIBRARY_PATH="/home/u59912/opencv-bin/lib:$LD_LIBRARY_PATH"
cd ~/image-stitch-oneapi
./stitch --d3 --mode scans 1.png 2.png 3.png 4.png 5.png
printf "\nImage Stitching Completed\n"
