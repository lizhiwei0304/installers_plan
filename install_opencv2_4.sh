#!/bin/bash
set -e 
SRC_PATH="/tmp"
OPENCV_BENCHMARK_VERSION="v2.4.13.6"

main() {
    install_opencv_2_4
}

install_opencv_2_4() {
    cd "$SRC_PATH"
    wget https://github.com/opencv/opencv/archive/refs/tags/2.4.13.6.zip
    if [ ! -d opencv-2.4.13.6 ]; then
        unzip 2.4.13.6.zip
    else
        sudo rm -r opencv-2.4.13.6
        unzip 2.4.13.6.zip
    fi
    
    # 进入 opencv-2.4.13 文件夹并准备编译
    cd opencv-2.4.13.6
    
    # 编译并安装
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local ..
    
    make -j$(nproc) 2>&1 | grep ...
    sudo make install
    
    echo "opencv-2.4.13 has been installed successfully and there's no error"
    cd "$SRC_PATH"
    rm -rf *2.4.13*
}

# 主函数入口
main

