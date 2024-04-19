#!/bin/bash
set -e  # exit on first error
UBUNTU_VERSION=`lsb_release --release | cut -f2`
SRC_PATH="/tmp"
GOOGLE_BENCHMARK_VERSION=1.5.0

main(){
        install_google_benchmark
}

install_google_benchmark() {
    wget https://github.com/google/benchmark/archive/refs/tags/v$GOOGLE_BENCHMARK_VERSION.zip
    cp v$GOOGLE_BENCHMARK_VERSION.zip $SRC_PATH
    cd $SRC_PATH
    unzip v$GOOGLE_BENCHMARK_VERSION.zip
    
    # go into benchmark folder and prepare for build
    cd benchmark-$GOOGLE_BENCHMARK_VERSION
    
    # compile and install
    mkdir -p build
    cd build
    cmake cmake -DBENCHMARK_ENABLE_GTEST_TESTS=OFF ../
    make install
    
    #test if it's successfully
    #cmake -E chdir "build" ctest --build-config Release

    echo "benchmark has been installed successfully and there's no error!!!"
    cd $SRC_PATH
    rm -rf *benchmark* *v*
}


# MAIN
main
