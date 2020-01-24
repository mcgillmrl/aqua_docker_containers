#!/bin/bash
set -e

# setup ros environment
cd /
source "/usr/share/gazebo/setup.sh"
source "/opt/ros/$ROS_DISTRO/setup.bash"
export PATH="/opt/conda/bin:$PATH"
export LIBRARY_PATH="/opt/conda/lib:$LIBRARY_PATH"
export LD_LIBRARY_PATH="/opt/conda/lib:$LD_LIBRARY_PATH"
export MKL_THREADING_LAYER=GNU
export MKL_INTERFACE_LAYER=GNU
export OMP_NUM_THREADS=1
export MKL_NUM_THREADS=4

# prepare ssh server
mkdir -p /var/run/sshd

# start up supervisord, all daemons should launched by supervisord.
/usr/bin/supervisord -c /root/supervisord.conf

exec "$@"
