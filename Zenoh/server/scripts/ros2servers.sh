#!/bin/bash
source /ros_entrypoint.sh &
ros2 run demo_nodes_cpp add_two_ints_server &
ros2 run examples_rclpy_minimal_action_server server &
ros2 run demo_nodes_cpp listener &
tail -f /dev/null