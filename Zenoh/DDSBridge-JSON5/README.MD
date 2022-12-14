# ZENOH-TESTING

Those tests consist on run ROS2 communication services (talker & listener, service calls and actions) using zenoh as the DDS bridge
The test has been run using a fix (eclipse/zenoh-bridge-dds:issue_102 ) to to solve the problems found on DDSBridge-SameHost and a configuration option       (reliable_routes_blocking) true in the zenoh bridge

Date of test: 12/14/2022

## Bandwith and network

Initial test of bandwith and latency

netperf -H 212.170.246.26 -p 5581 TCP_STREAM -l 5 -f M --  -m 1500
netperf -H 212.170.246.26 -p 5600 -l 5  -t TCP_RR  -v 2 -- -o mean_latency

|  | Bandwidth | Latency |
| ---     | ---       |---  |
|Initial |9.21 Mbits/s | 18,90125|

## Scenario 1 - Talker & Listener

Login on VM-1 and run:

```bash
docker exec -it roshumble /bin/bash
source /ros_entrypoint.sh
ros2 run demo_nodes_cpp listener
```

Login on VM-2 and run

```bash
docker exec -it roshumble /bin/bash
source /ros_entrypoint.sh
ros2 run demo_nodes_cpp talker

```

### Result of the test 1

Success. Listener can heard the hello world

## Scenario 2 - Services

Login on VM-1 and run:

```bash
docker exec -it roshumble /bin/bash
source /ros_entrypoint.sh
ros2 run demo_nodes_cpp add_two_ints_server
```

Login on VM-2 and run

```bash
docker exec -it roshumble /bin/bash
source /ros_entrypoint.sh
ros2 run demo_nodes_cpp add_two_ints_client_async
```

### Result of the test 2

No success: Service client not getting a response

## Scenario 3 - Actions

Login on VM-1 and run:

```bash
docker exec -it roshumble /bin/bash
source ./ros_entrypoint
ros2 run examples_rclpy_minimal_action_client client
```

Login on VM-2 and run

```bash
docker exec -it roshumble /bin/bash
source ./ros_entrypoint
ros2 run examples_rclpy_minimal_action_server server
```

### Result of the test 3

Success: Actions works

```bash
ros2 run examples_rclpy_minimal_action_server server
[INFO] [1668011367.959643256] [minimal_action_server]: Received goal request
[INFO] [1668011367.961895680] [minimal_action_server]: Executing goal...
[INFO] [1668011367.962800218] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1])
[INFO] [1668011368.964878356] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2])
[INFO] [1668011369.967383982] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3])
[INFO] [1668011370.969537183] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3, 5])
[INFO] [1668011371.971938903] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3, 5, 8])
[INFO] [1668011372.974365694] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13])
[INFO] [1668011373.976928993] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21])
[INFO] [1668011374.979242696] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
[INFO] [1668011375.981604490] [minimal_action_server]: Publishing feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
[INFO] [1668011376.983688729] [minimal_action_server]: Returning result: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
```

```bash
ros2 run examples_rclpy_minimal_action_client client
[INFO] [1668011367.967927369] [minimal_action_client]: Waiting for action server...
[INFO] [1668011367.968937094] [minimal_action_client]: Sending goal request...
[INFO] [1668011367.988551676] [minimal_action_client]: Goal accepted :)
[INFO] [1668011367.990580073] [minimal_action_client]: Received feedback: array('i', [0, 1, 1])
[INFO] [1668011368.992727297] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2])
[INFO] [1668011369.995345665] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3])
[INFO] [1668011370.997656103] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3, 5])
[INFO] [1668011371.999845894] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3, 5, 8])
[INFO] [1668011373.001950653] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13])
[INFO] [1668011374.004717313] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21])
[INFO] [1668011375.006840542] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])
[INFO] [1668011376.009337789] [minimal_action_client]: Received feedback: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])
[INFO] [1668011377.011751442] [minimal_action_client]: Goal succeeded! Result: array('i', [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55])

```
