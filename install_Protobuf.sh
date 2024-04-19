#!/bin/bash
set -e  # exit on first error
UBUNTU_VERSION=`lsb_release --release | cut -f2`
SRC_PATH="/tmp"
PROTOBUF_BENCHMARK_VERSION=3.13.0

main(){
	install_dependencies
        install_google_protobuf
}

install_dependencies(){
    sudo apt-get install autoconf automake libtool curl make g++ unzip
}

install_google_protobuf() {
    cd $SRC_PATH
    wget https://github.com/protocolbuffers/protobuf/releases/download/v3.13.0/protobuf-all-$PROTOBUF_BENCHMARK_VERSION.tar.gz
    
    tar -xf protobuf-all-$PROTOBUF_BENCHMARK_VERSION.tar.gz   
    cd protobuf-$PROTOBUF_BENCHMARK_VERSION
    
    # go into protobuf folder and prepare for build
    ./autogen.sh
    
    # compile and install
    ./configure
    make
    make check
    sudo make install
    sudo ldconfig # refresh shared library cache.
    
    cd $SRC_PATH
    rm -rf *pro*
    echo "protobuf-3.13.0 has been installed successfully and there's no error"
}


# MAIN
main
