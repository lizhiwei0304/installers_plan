#!/bin/bash
set -e # exit on the first error
apt-get update
apt-get install -y python-catkin-tools
apt-get install -y ros-melodic-pcl-ros ros-melodic-costmap-2d ros-melodic-grid-map
apt-get install -y ros-melodic-rosparam-handler
apt-get install -y autoconf automake libtool
apt-get install -y ros-melodic-qt-build
apt-get install -y ros-melodic-rviz-visual-tools
apt-get install -y ros-melodic-grid-map-sdf
apt-get install -y ros-melodic-tf2-sensor-msgs
apt-get install -y libgeographic-dev
apt-get install -y libgtest-dev
apt-get install -y ros-melodic-tf2-geometry-msgs

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

