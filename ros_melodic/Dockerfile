#  This file was created by merging the ros:lunar-ros-base-xenial and continuumio:miniconda images
FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu18.04

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO melodic
ENV DEBIAN_FRONTEND=noninteractive
#ENV PATH /opt/conda/bin:$PATH
#ENV CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"

# install apt packages
RUN apt-get update --fix-missing && apt-get install -y software-properties-common && \
    # add-apt-repository -y ppa:ubuntugis/ubuntugis-unstable && \
    apt-get update --fix-missing && apt-get install -y gcc cmake wget bzip2 ca-certificates \
    libopencv-dev vim git mercurial \
    libgl1-mesa-dev libglew-dev libegl1-mesa-dev \
    libwayland-dev libxkbcommon-dev wayland-protocols \
    ffmpeg libavcodec-dev libavutil-dev libavformat-dev \
    libswscale-dev libavdevice-dev libjpeg-dev libpng-dev \
    libtiff5-dev libopenexr-dev terminator vim python-pip \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# install miniconda
# install required packages for running ros on top of the conda distribution
#RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
#    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
#    rm ~/miniconda.sh && \
#    conda update -y conda && \
#    conda install -y numpy scipy mkl krb5 tensorflow-gpu=1.15 pytorch-gpu opencv && \
#    pip install -U pyyaml rosdep rosinstall_generator wstool rosinstall six vcstools setuptools catkin_pkg empy defusedxml netifaces cmake pycrypto

RUN pip install -U tensorflow-gpu==1.14 torch future

# setup keys, sources.list
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

# install ros packages and bootstrap rosdep
RUN apt-get update && apt-get install -y ros-$ROS_DISTRO-ros-core \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && rosdep init \
    && rosdep update

RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" > /root/.bashrc

EXPOSE 11311 33690

COPY ./ros_entrypoint.sh /
COPY ./inputrc /root/.inputrc
RUN chmod a+x /ros_entrypoint.sh
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]

