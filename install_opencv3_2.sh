#!/bin/bash
set -e  # exit on first error
SRC_PATH="/tmp"
OPENCV_BENCHMARK_VERSION=3.2.0

main(){
     sudo apt-get install -y cmake libgtk2.0-dev libavcodec-dev libavformat-dev libjpeg-dev libpng-dev libtiff-dev libtiff5-dev libswscale-dev libcurl4-openssl-dev libtbb2 libdc1394-22-dev
     
     sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
     sudo apt update
     sudo apt install -y libjasper1 libjasper-dev
     install_opencv_3_2
}

install_opencv_3_2() {

    cd $SRC_PATH
    wget https://github.com/opencv/opencv/archive/3.2.0.tar.gz
    wget https://github.com/opencv/opencv_contrib/archive/3.2.0.tar.gz
   
    tar -xf 3.2.0.tar.gz
    tar -xf 3.2.0.tar.gz.1
    mv opencv_contrib-3.2.0/ opencv-3.2.0/

    cd opencv-3.2.0/
    # compile and install
    mkdir build
    cd build

    cmake -D CMAKE_BUILD_TYPE=Release -D OPENCV_GENERATE_PKGCONFIG=ON -D ENABLE_PRECOMPILED_HEADERS=OFF -D CMAKE_INSTALL_PREFIX=/usr/local/opencv3.2 -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-3.2.0/modules ..
    
    make -j$(nproc) 2>&1 | grep ...
    sudo make install

    echo "export SNOPT_HOME=/usr/local/lib/" >> ~/.bashrc
    source ~/.bashrc
    sudo ldconfig
    
    cd $SRC_PATH
    rm -rf *3.2*
    echo "opencv-3.2 has been installed successfully and there's no error"
}


# MAIN
main
