#!/bin/bash
source /ros_entrypoint.sh

ros2 run demo_nodes_cpp talker &


echo "starting testing services"
SER_ERROR=0
SER_SUCCESS=0
for i in {1..50}
do
    ros2 run demo_nodes_cpp add_two_ints_client
    if [ $? -gt 0 ]
    then
            echo "error"
            ((SER_ERROR=SER_ERROR+1))
    else
            echo "success"
            ((SER_SUCCESS=SER_SUCCESS+1))
    fi
done


echo "starting testing actions"
ACT_ERROR=0
ACT_SUCCESS=0
for i in {1..50}
do
    ros2 run examples_rclpy_minimal_action_client client
    if [ $? -gt 0 ]
    then
            echo "error"
            ((ACT_ERROR=ACT_ERROR+1))
    else
            echo "success"
            ((ACT_SUCCESS=ACT_SUCCESS+1))
    fi
done



echo "printing results"
echo "-----------------------------------"
echo "SERVICES"
echo "SER_SUCCESS: " $SER_SUCCESS
echo "SER_ERROR: " $SER_ERROR

echo "-----------------------------------"
echo "ACTIONS"
echo "ACT_SUCCESS: " $ACT_SUCCESS
echo "ACT_ERROR: " $ACT_ERROR