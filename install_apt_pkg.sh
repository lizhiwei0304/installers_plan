#!/bin/bash
set -e # exit on the first error
sudo apt-get update
sudo apt-get install -y python-catkin-tools
sudo apt-get install -y ros-melodic-pcl-ros ros-melodic-costmap-2d ros-melodic-grid-map
sudo apt-get install -y ros-melodic-rosparam-handler
sudo apt-get install -y autoconf automake libtool
sudo apt-get install -y ros-melodic-qt-build
sudo apt-get install -y ros-melodic-rviz-visual-tools
sudo apt-get install -y ros-melodic-grid-map-sdf
sudo apt-get install -y ros-melodic-tf2-sensor-msgs
sudo apt-get install -y libgeographic-dev
sudo apt-get install -y libgtest-dev
sudo apt-get install -y ros-melodic-tf2-geometry-msgs
sudo apt-get install -y libgfortran3 
sudo apt-get install -y build-essential cmake libboost-all-dev libeigen3-dev libode-dev python-dev python3-dev
sudo apt-get install -y ros-melodic-libompl*
sudo apt-get install -y libompl-dev ompl-demos


echo "Installing benchmark"
./install_benchmark.sh
echo "Benchmark installation completed"

echo "Installing casadi"
./install_casadi.sh
echo "Casadi installation completed"

echo "Installing ceres"
./install_ceres.sh
echo "Ceres installation completed"

echo "Installing cppad"
./install_cppad.sh
echo "Cppad installation completed"

echo "Installing ipopt"
./install_ipopt.bash
echo "Ipopt installation completed"

echo "Installing libccd_fcl"
./install_libccd_fcl.sh
echo "Libccd_fcl installation completed"

echo "Installing nlopt"
./install_nlopt.sh
echo "Nlopt installation completed"

echo "Installing opencv2_4"
./install_opencv2_4.sh
echo "OpenCV2.4 installation completed"

echo "Installing opencv3_2"
./install_opencv3_2.sh
echo "OpenCV3.2 installation completed"

echo "Installing osqp"
./install_osqp.sh
echo "Osqp installation completed"

echo "Installing Protobuf"
./install_Protobuf.sh
echo "Protobuf installation completed"

echo "Installing Snopt"
./snopt_binary/install.sh
echo "Snopt installation completed"

