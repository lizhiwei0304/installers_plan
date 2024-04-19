# version: 0.0.1
FROM osrf/ros:melodic-desktop-full

RUN rm /etc/apt/sources.list.d/ros1-snapshots.list \
    && apt update \
    && apt install -y lsb-release \
    && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && sed -i "s/cn.archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt update \
    && apt install -y libusb-dev curl \
    && sh -c '. /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list' \
    && curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | apt-key add - \
    && apt update \
    && echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc \
    && echo 'alias sds="source devel/setup/bash"' >> ~/.bashrc
