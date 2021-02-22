# OpenCV Image Stitching OneAPI
A demo of running OpenCV Image Stitching in Intel OneAPI Devcloud

Detailed Installation process is described [here.](https://github.com/forkbomb-666/opencv-image-stitching-oneapi/blob/main/opencv-image-stitch-oneapi.ipynb)

### Compile the program

The compilation script is given below:

**`compile.sh`**

```bash
#!/usr/bin/env bash
export PKG_CONFIG_PATH="/home/u59912/opencv-bin/lib/pkgconfig:$PKG_CONFIG_PATH"

echo "OpenCV Version:"

pkg-config --modversion opencv4

dpcpp stitch.cpp -o stitch `pkg-config --cflags --libs opencv4`

echo "Compilation Finished!"
```

Run the script:

```bash
$ chmod +x compile.sh
$ ./compile.sh
```



### Run the Program

The run script is given below:

**`run.sh`**

```bash
#!/usr/bin/env bash
source /opt/intel/inteloneapi/setvars.sh --force

export LD_LIBRARY_PATH="/home/u59912/opencv-bin/lib:$LD_LIBRARY_PATH"

cd ~/image-stitch-oneapi

./stitch --d3 --mode scans 1.png 2.png 3.png 4.png 5.png

printf "\nImage Stitching Completed\n"
```

For the demo, 5 pictures from google earth is used.

Submit the script to DevCloud as a job:

```bash
$ chmod +x run.sh
$ qsub run.sh # CPU Job
$ qsub -l nodes=1:gpu:ppn=2 -d . run.sh # GPU job
```

### Get Result

Output image is saved as `result.jpg`.

![](C:\Users\Snehangshu\Desktop\devcloud\combined.png)