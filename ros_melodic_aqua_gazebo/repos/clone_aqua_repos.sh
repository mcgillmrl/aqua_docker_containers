
export CIM_USER=$1
export CIM_URL=$2
export AQUA_ROS_HOME=$3
export GITLAB_USER=$4
export GITLAB_PWD=$5
export GITLAB_URL=$6
CURR_DIR=`pwd` 

mkdir -p aqua_ws/src
mkdir -p extras_ws/src

ssh-keygen
ssh-copy-id $CIM_USER@$CIM_URL

# clone ros packages
cd $CURR_DIR/aqua_ws/src
mkdir aqua_related
cd aqua_related
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquaactions
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquaautopilot
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquacore
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquadepth
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aqua_description
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aqua_gait
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aqua_gazebo
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquaimu
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquajoy
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aqualaunch
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/aquapositioning

cd $CURR_DIR/extras_ws/src
mkdir learning_related
cd learning_related
git clone https://github.com/mcgillmrl/robot_learning
git clone http://$GITLAB_USER:$GITLAB_PWD@$GITLAB_URL/aqua/aquacoralnavnetwork
hg clone ssh://$CIM_USER@$CIM_URL/$AQUA_ROS_HOME/../../travis/aqua_path_learning

cd $CURR_DIR/extras_ws/src
mkdir vo_related
cd vo_related
git clone http://$GITLAB_USER:$GITLAB_PWD@$GITLAB_URL/aqua/ping_driver
git clone http://$GITLAB_USER:$GITLAB_PWD@$GITLAB_URL/jft/dso_ros
git clone http://$GITLAB_USER:$GITLAB_PWD@$GITLAB_URL/jft/sonar_scale_computer
git clone http://$GITLAB_USER:$GITLAB_PWD@$GITLAB_URL/jft/aqua_ekf

cd $CURR_DIR
mkdir lib
cd lib
git clone https://github.com/stevenlovegrove/pangolin
git clone http://$GITLAB_USER:$GITLAB_PWD@$GITLAB_URL/jft/dso

