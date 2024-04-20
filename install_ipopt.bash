#!/bin/bash

set -e # exit on first error

install_ipopt()
{

    echo "Prepare to install IPOPT ..."
    IPOPT="Ipopt"
    VERSION="3.12.4"
    IPOPT_URL="https://www.coin-or.org/download/source/Ipopt/Ipopt-3.12.4.zip"
    TEMP_DIR=/tmp

    sudo apt-get install -y gfortran
    echo "decide whether to install"
  #  if ( ldconfig -p | grep libipopt ); then
  #      echo "Ipopt is already installed......."
  #  else
        echo "Start installing Ipopt, version: $VERSION .........."
        cd $TEMP_DIR
        wget $IPOPT_URL
        unzip Ipopt-3.12.4.zip
        rm -rf Ipopt-3.12.4.tar.gz

        echo "Installing third party dependencies ..."
        cd Ipopt-3.12.4/

        # configure,build and install the IPOPT
        echo "Configuring and building IPOPT ..."

        ./configure --prefix /usr/local 2>&1 | grep ...
        make -j$(nproc) 2>&1 | grep ...  # filter error messages written to stderr 
        make install > /dev/null
        cd "$HOME"
        if (grep 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' $HOME/.bashrc); then
          echo "LD_LIBRARY_PATH has been set."
        else
          echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> $HOME/.bashrc
        fi
        sudo ldconfig
        echo "IPOPT installed successfully"
        source $HOME/.bashrc
        
        # cd $TEMP_DIR
        # rm -rf *Ipopt*
   # fi
}

install_ipopt
