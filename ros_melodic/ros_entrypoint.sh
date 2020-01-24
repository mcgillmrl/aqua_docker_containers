#!/bin/bash
set -e

# setup ros environment
source "/opt/ros/$ROS_DISTRO/setup.bash"
export MKL_THREADING_LAYER=GNU
export MKL_INTERFACE_LAYER=GNU
export OMP_NUM_THREADS=4
export MKL_NUM_THREADS=4

exec "$@"
