FROM juancamilog/ros_melodic:with_cuda

# setup sources.list, install dependencies
RUN wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add - && \
    sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'

# install gazebo ros and other dependendices
RUN apt-get update && apt-get install -y \ 
    gazebo9 libgazebo9-dev \
    ros-$ROS_DISTRO-gazebo-ros ros-$ROS_DISTRO-gazebo-plugins \
    ros-$ROS_DISTRO-xacro ros-$ROS_DISTRO-robot-state-publisher \
    ros-$ROS_DISTRO-robot-localization ros-$ROS_DISTRO-rviz \
    ros-$ROS_DISTRO-joystick-drivers ros-$ROS_DISTRO-tf-conversions \
    ros-$ROS_DISTRO-pcl-ros ros-$ROS_DISTRO-eigen-conversions \
    ros-$ROS_DISTRO-rqt-image-view ros-$ROS_DISTRO-rqt-reconfigure \
    && rm -rf /var/lib/apt/lists/*

# install ui
RUN apt-get update && \
    apt-get install -y supervisor \
    openssh-server vim-tiny \
    xfce4 xfce4-goodies \
    x11vnc xvfb \
    firefox terminator \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# setup environment
WORKDIR /root
COPY startup.sh ./
COPY supervisord.conf ./
COPY ./ros_gazebo_entrypoint.sh /

EXPOSE 11345 8080 7681
EXPOSE 5900
EXPOSE 22

RUN chmod a+x /ros_gazebo_entrypoint.sh
ENTRYPOINT ["/ros_gazebo_entrypoint.sh"]
CMD ["bash"]

