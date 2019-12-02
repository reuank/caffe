# Caffe

## My comments on the installation process of Caffe (CPU only) on MacOS 10.15.1 with Homebrew, Python 3.7.5 and OpenCV 4.1.2 

I followed this guide and made a few changes to fit my version needs: [https://www.dazhuanlan.com/2019/08/15/5d5514f5efcdc/](https://www.dazhuanlan.com/2019/08/15/5d5514f5efcdc/)

- My changes to `Makefile.config` and `include/caffe/ommon.hpp` are already committed here

- If the pre-make step fails fails in the build folder due to a `vecLib` related Error, edit `CMakeCache.txt` and set `vecLib_INCLUDE_DIR:PATH=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/System/Library/Frameworks/Accelerate.framework/Versions/Current/Frameworks/vecLib.framework/Headers`

- My edits to `CMakeCache.txt` after running `cmake` for premake:

```
//Path to a program.
PYTHON_EXECUTABLE:FILEPATH=/usr/local/bin/python3

//Path to a file.
PYTHON_INCLUDE_DIR:PATH=/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/include/python3.7m

//Path to a library.
PYTHON_LIBRARY:FILEPATH=/usr/local/Cellar/python/3.7.5/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7m.dylib

//Flags used by the CXX compiler during all build types.
CMAKE_CXX_FLAGS:STRING=-std=c++11
  
//Boost python library (release)
Boost_PYTHON_LIBRARY_RELEASE:FILEPATH=/usr/local/Cellar/boost-python3/1.71.0_1/lib/libboost_python37-mt.dylib
  
//Build Caffe without CUDA support
CPU_ONLY:BOOL=ON
```

- For `sudo make test` not to fail (see [this](https://github.com/BVLC/caffe/issues/6491#issuecomment-491557179)), I need to change

```
ifeq ($(OSX), 1)
	CXX := /usr/bin/clang++
```

into

```
ifeq ($(OSX), 1)
	CXX := /usr/bin/clang++ -std=c++11
```

## Regular README

[![Build Status](https://travis-ci.org/BVLC/caffe.svg?branch=master)](https://travis-ci.org/BVLC/caffe)
[![License](https://img.shields.io/badge/license-BSD-blue.svg)](LICENSE)

Caffe is a deep learning framework made with expression, speed, and modularity in mind.
It is developed by Berkeley AI Research ([BAIR](http://bair.berkeley.edu))/The Berkeley Vision and Learning Center (BVLC) and community contributors.

Check out the [project site](http://caffe.berkeleyvision.org) for all the details like

- [DIY Deep Learning for Vision with Caffe](https://docs.google.com/presentation/d/1UeKXVgRvvxg9OUdh_UiC5G71UMscNPlvArsWER41PsU/edit#slide=id.p)
- [Tutorial Documentation](http://caffe.berkeleyvision.org/tutorial/)
- [BAIR reference models](http://caffe.berkeleyvision.org/model_zoo.html) and the [community model zoo](https://github.com/BVLC/caffe/wiki/Model-Zoo)
- [Installation instructions](http://caffe.berkeleyvision.org/installation.html)

and step-by-step examples.

## Custom distributions

 - [Intel Caffe](https://github.com/BVLC/caffe/tree/intel) (Optimized for CPU and support for multi-node), in particular Intel® Xeon processors.
- [OpenCL Caffe](https://github.com/BVLC/caffe/tree/opencl) e.g. for AMD or Intel devices.
- [Windows Caffe](https://github.com/BVLC/caffe/tree/windows)

## Community

[![Join the chat at https://gitter.im/BVLC/caffe](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/BVLC/caffe?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Please join the [caffe-users group](https://groups.google.com/forum/#!forum/caffe-users) or [gitter chat](https://gitter.im/BVLC/caffe) to ask questions and talk about methods and models.
Framework development discussions and thorough bug reports are collected on [Issues](https://github.com/BVLC/caffe/issues).

Happy brewing!

## License and Citation

Caffe is released under the [BSD 2-Clause license](https://github.com/BVLC/caffe/blob/master/LICENSE).
The BAIR/BVLC reference models are released for unrestricted use.

Please cite Caffe in your publications if it helps your research:

    @article{jia2014caffe,
      Author = {Jia, Yangqing and Shelhamer, Evan and Donahue, Jeff and Karayev, Sergey and Long, Jonathan and Girshick, Ross and Guadarrama, Sergio and Darrell, Trevor},
      Journal = {arXiv preprint arXiv:1408.5093},
      Title = {Caffe: Convolutional Architecture for Fast Feature Embedding},
      Year = {2014}
    }
