#!/bin/bash

##### PREMAKE
mkdir build
cd build
cmake ..
cp -i ../presets/CMakeCache.txt.prebuild CMakeCache.txt
cmake ..

##### MAKE
# Setting Caffe_CPU_ONLY ON
cp -i ../presets/CaffeConfig.cmake.final CaffeConfig.cmake
# Setting Python Paths, CMake Flag and CPU Only=ON
cp -i ../presets/CMakeCache.txt.final CMakeCache.txt

cmake ..
sudo make all
sudo make test && sudo make runtest
sudo make pycaffe && sudo make pytest
