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
    mv 3.2.0.tar.gz opencv-3.2.0.tar.gz
    rm 3.2.0.tar.gz
    
    wget https://github.com/opencv/opencv_contrib/archive/3.2.0.tar.gz
    mv 3.2.0.tar.gz opencv_contrib-3.2.0.tar.gz
    rm 3.2.0.tar.gz
   
    tar -xf opencv-3.2.0.tar.gz
    tar -xf opencv_contrib-3.2.0.tar.gz
    mv opencv_contrib-3.2.0/ opencv-3.2.0/

    cd opencv-3.2.0/
    # compile and install
    mkdir build
    cd build

    cmake -D CMAKE_BUILD_TYPE=Release -D OPENCV_GENERATE_PKGCONFIG=ON -D ENABLE_PRECOMPILED_HEADERS=OFF -D CMAKE_INSTALL_PREFIX=/usr/local/ -D OPENCV_EXTRA_MODULES_PATH=../opencv_contrib-3.2.0/modules ..
    
    make -j$(nproc) 2>&1 | grep ...
    sudo make install 2>&1 | grep ...

    # 检查 ~/.bashrc 是否包含指定的行
    if ! grep -q "export SNOPT_HOME=/usr/local/lib:$LD_LIBRARY_PATH" ~/.bashrc; then
         # 如果没有包含，则添加到 ~/.bashrc
         echo "export SNOPT_HOME=/usr/local/lib:$LD_LIBRARY_PATH" >> ~/.bashrc
    fi

    source ~/.bashrc
    sudo ldconfig
    
    cd $SRC_PATH
    rm -rf *3.2*
    echo "opencv-3.2 has been installed successfully and there's no error"
}


# MAIN
main
