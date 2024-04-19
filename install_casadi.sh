#!/bin/bash
set -e  # exit on first error
UBUNTU_VERSION=`lsb_release --release | cut -f2`
SRC_PATH="/tmp"
CASADI_VERSION=3.5.0

main(){
    install_cadadi
}

install_cadadi() {
    cd $SRC_PATH
    wget https://github.com/casadi/casadi/archive/refs/tags/$CASADI_VERSION.tar.gz
    
    tar -xf $CASADI_VERSION.tar.gz
    
    # go into benchmark folder and prepare for build
    cd casadi-$CASADI_VERSION/
    
    # compile and install
    mkdir -p build
    cd build
    cmake ../
    sudo make install
    
    #test if it's successfully
    #cmake -E chdir "build" ctest --build-config Release

    cd $SRC_PATH
    rm -rf *casadi* *$CASADI_VERSION*
    
    echo "casadi has been installed successfully if there's no error"
}


# MAIN
main
