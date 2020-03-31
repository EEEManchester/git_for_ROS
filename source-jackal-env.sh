#===================================================================================================================================================

# =========== ROS Config ===============
source /opt/ros/kinetic/setup.bash
source /home/administrator/catkin_ws/devel/setup.bash
#source /home/administrator/cartographer_ws/devel/setup.bash

#========== Export JACKAL_VARIABLES==============================================================

export JACKAL_PS4=1

# ======= Terminal Config ==========

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# defines the style of the prompt
PS1='\[\e[1;35m\]administrator:\[\e[1;36m\]\d-\A\[\e[1;35m\]:\[\e[1;36m\]\w\[\e[1;35m\]\$\[\e[0m\] '

# ========= ROS Config ==============

export EDITOR="vim"

export ROS_MASTER_URI=http://192.168.0.76:11311
export ROS_IP=192.168.0.76

#export ROS_MASTER_URI=http://$(ifconfig | awk '/inet addr/{print substr($2,6)}' | tail -n 1):11311
#export ROS_IP=$(ifconfig | awk '/inet addr/{print substr($2,6)}' | tail -n 1)

echo "ROS_MASTER_URI: "$ROS_MASTER_URI
echo "ROS_IP: "$ROS_IP
echo 'Jackal Hostname: ' $(hostname)

# ========= alias cmd ===============

carma2_eth=192.168.131.11
carma2_wifi=192.168.0.220

alias carma2_ps4='sudo ds4drv'
alias carma2_ps4_test_gui='jstest-gtk /dev/input/js1'
alias carma2_ps4_test='jstest /dev/input/js1'

alias carma2_rviz='roslaunch carma_2_display carma2_rviz_ps4.launch'

alias carma2_connect_eth='ssh administrator@$carma2_eth -X'
alias carma2_connect_wifi='ssh administrator@$carma2_wifi -X'

alias carma2_export_eth='export ROS_MASTER_URI=http://$carma2_eth:11311' 
alias carma2_export_wifi='export ROS_MASTER_URI=http://$carma2_wifi:11311'

#alias carma2_file_make_mnt_points='sudo mkdir /mnt/CARMA2_Home && sudo mkdir /mnt/administrator/'

#alias carma2_file_eth='sudo sshfs -o default_permissions,allow_other,identityfile=/home/reel/.ssh/id_rsa administrator@$carma2_eth:/home/administrator/ /mnt/CARMA2_Home/'
#alias carma2_file_wifi='sudo sshfs -o default_permissions,allow_other,identityfile=/home/reel/.ssh/id_rsa administrator@$carma2_wifi:/home/administrator/ /mnt/CARMA2_Home/'

