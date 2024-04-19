#!/bin/bash

set -e # exit on first error

main() {
  install_apt_pkgs
  install_nlopt
}


install_apt_pkgs() {
  apt-get update
  apt-get -y install cmake g++
}

install_nlopt()
{

    echo "Prepare to install NLopt ..."
    cd /tmp && rm -rf nlopt*
    git clone --depth 1 --branch v2.5.0 https://github.com/stevengj/nlopt.git
    cd nlopt && mkdir -p build && cd build
    cmake -DWITH_CXX="ON" ..
    make -j$(nproc)
    make install
    
    cd /tmp
    rm -rf nlopt*
    echo "nlopt has been installed successfully and there's no error!"
}

main
