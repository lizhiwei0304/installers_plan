#!/bin/bash
set -e  # exit on first error
UBUNTU_VERSION=`lsb_release --release | cut -f2`
OSQP_VERSION=0.6.2
OSQP_EIGEN_ERSION=0.6.2
SRC_PATH="/tmp"

main(){
        install_osqp
        install_osqp_eigen
        cd $SRC_PATH
        rm -rf *osqp* *v* *complete*
}

install_osqp() {
    cd $SRC_PATH
    wget https://github.com/osqp/osqp/releases/download/v$OSQP_VERSION/complete_sources.zip

    unzip complete_sources.zip
    
    # go into Osqp folder and prepare for build
    cd $SRC_PATH
    cd osqp/
    
    # compile and install
    mkdir -p build
    cd build
    cmake ../
    sudo make install
    
    echo "Osqp has been installed successfully and there's no error"
}

install_osqp_eigen() {
    cd $SRC_PATH
    wget https://github.com/robotology/osqp-eigen/archive/refs/tags/v$OSQP_EIGEN_ERSION.zip
    unzip v$OSQP_EIGEN_ERSION.zip
    cd osqp-eigen-$OSQP_EIGEN_ERSION
    
    # compile and install
    mkdir -p build
    cd build
    cmake ../
    sudo make install
    
    echo "osqp_eigen has been installed successfully and there's no error"
}


# MAIN
main
