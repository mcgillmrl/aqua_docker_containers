<<<<<<< HEAD
FROM juancamilog/ros_melodic_gazebo_conda:with_cuda

# install pytorch and tf
RUN conda install tensorflow-gpu=1.15 pytorch-gpu pandas \
    && conda clean -a -y

#install dependencies
RUN apt-get update && apt-get install -y \ 
    libgl1-mesa-dev libglew-dev libegl1-mesa-dev \
    libwayland-dev libxkbcommon-dev wayland-protocols \
    ffmpeg libavcodec-dev libavutil-dev libavformat-dev \
    libswscale-dev libavdevice-dev libjpeg-dev libpng-dev \
    libtiff5-dev libopenexr-dev terminator vim \
    libsuitesparse-dev libeigen3-dev libboost-all-dev libopencv-dev \
    ros-$ROS_DISTRO-robot-localization ros-$ROS_DISTRO-rviz \
    ros-$ROS_DISTRO-joystick-drivers ros-$ROS_DISTRO-tf-conversions \
    ros-$ROS_DISTRO-pcl-ros ros-$ROS_DISTRO-eigen-conversions \
=======
FROM juancamilog/ros_melodic_gazebo:with_cuda

#install dependencies
RUN apt-get update && apt-get install -y \ 
    libsuitesparse-dev libeigen3-dev libboost-all-dev\
    && apt-get clean && apt-get autoclean \
>>>>>>> 197b4f3... removed conda
    && rm -rf /var/lib/apt/lists/*

RUN pip install pandas matplotlib

# build dso
COPY repos/lib /lib
RUN /bin/bash -c "cd /lib/pangolin && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j`nproc` && \
    cd /lib/dso && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j`nproc`"
ENV DSO_PATH /lib/dso

# build ros packages
RUN mkdir -p /aqua_ws/src
COPY repos/aqua_ws/src /aqua_ws/src
RUN /bin/bash -c " source /opt/ros/${ROS_DISTRO}/setup.bash && \
    cd /aqua_ws/src && \ 
    catkin_init_workspace && \
    cd /aqua_ws && \
    catkin_make -j`nproc` && \
    cd / "


# setup init
RUN echo "source /aqua_ws/devel/setup.bash" >> ~/.bashrc
RUN echo "source /extras_ws/devel/setup.bash" >> ~/.bashrc

ENTRYPOINT ["/ros_gazebo_entrypoint.sh"]
CMD ["bash"]

