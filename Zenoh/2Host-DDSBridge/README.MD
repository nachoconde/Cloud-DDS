# ZENOH-TESTING

## Summary

| Test     | Result |
| ---      | ---       |
| Talker & Listener |:white_check_mark: |
| Services calls     |   :x:     |
| Actions      |   :white_check_mark:     |

## Scenario 1 - Talker & Listener

Login on VM-1 and run:

```bash
docker exec -it roshumble /bin/bash
source ./ros_entrypoint
ros2 run demo_nodes_cpp listener
```

Login on VM-2 and run

```bash
docker exec -it roshumble /bin/bash
source ./ros_entrypoint
ros2 run demo_nodes_cpp talker

```

### Result of the test 1

Success. Listener can heard the hello world

```bash
[INFO] [1668010153.858651685] [listener]: I heard: [Hello World: 1]
[INFO] [1668010154.857863364] [listener]: I heard: [Hello World: 2]
[INFO] [1668010155.857946670] [listener]: I heard: [Hello World: 3]
[INFO] [1668010156.858218800] [listener]: I heard: [Hello World: 4]
[INFO] [1668010157.857920628] [listener]: I heard: [Hello World: 5]
[INFO] [1668010158.858174289] [listener]: I heard: [Hello World: 6]
```

Zenoh logs on machine-1

```bash
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] Ignoring Subscription for resource ros_discovery_info as it is not allowed (see your 'allow' or 'deny' configuration)
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rt/rosout' => DDS Writer dd311001d8d322d89b8a0ae200000503 on 'rt/rosout' with type 'rcl_interfaces::msg::dds_::Log_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] Ignoring Publication for resource ros_discovery_info as it is not allowed (see your 'allow' or 'deny' configuration)
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rr/talker/get_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200000603 on 'rr/talker/get_parametersReply' with type 'rcl_interfaces::srv::dds_::GetParameters_Response_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200000704 on 'rq/talker/get_parametersRequest' => zenoh 'rq/talker/get_parametersRequest' with type 'rcl_interfaces::srv::dds_::GetParameters_Request_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rr/talker/get_parameter_typesReply' => DDS Writer dd311001d8d322d89b8a0ae200000803 on 'rr/talker/get_parameter_typesReply' with type 'rcl_interfaces::srv::dds_::GetParameterTypes_Response_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200000904 on 'rq/talker/get_parameter_typesRequest' => zenoh 'rq/talker/get_parameter_typesRequest' with type 'rcl_interfaces::srv::dds_::GetParameterTypes_Request_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rr/talker/set_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200000a03 on 'rr/talker/set_parametersReply' with type 'rcl_interfaces::srv::dds_::SetParameters_Response_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200000b04 on 'rq/talker/set_parametersRequest' => zenoh 'rq/talker/set_parametersRequest' with type 'rcl_interfaces::srv::dds_::SetParameters_Request_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rr/talker/set_parameters_atomicallyReply' => DDS Writer dd311001d8d322d89b8a0ae200000c03 on 'rr/talker/set_parameters_atomicallyReply' with type 'rcl_interfaces::srv::dds_::SetParametersAtomically_Response_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200000d04 on 'rq/talker/set_parameters_atomicallyRequest' => zenoh 'rq/talker/set_parameters_atomicallyRequest' with type 'rcl_interfaces::srv::dds_::SetParametersAtomically_Request_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rr/talker/describe_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200000e03 on 'rr/talker/describe_parametersReply' with type 'rcl_interfaces::srv::dds_::DescribeParameters_Response_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200000f04 on 'rq/talker/describe_parametersRequest' => zenoh 'rq/talker/describe_parametersRequest' with type 'rcl_interfaces::srv::dds_::DescribeParameters_Request_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rr/talker/list_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200001003 on 'rr/talker/list_parametersReply' with type 'rcl_interfaces::srv::dds_::ListParameters_Response_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001104 on 'rq/talker/list_parametersRequest' => zenoh 'rq/talker/list_parametersRequest' with type 'rcl_interfaces::srv::dds_::ListParameters_Request_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rt/parameter_events' => DDS Writer dd311001d8d322d89b8a0ae200001203 on 'rt/parameter_events' with type 'rcl_interfaces::msg::dds_::ParameterEvent_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001304 on 'rt/parameter_events' => zenoh 'rt/parameter_events' with type 'rcl_interfaces::msg::dds_::ParameterEvent_'
zenoh        | [2022-11-09T16:09:12Z INFO  zplugin_dds] New route: zenoh 'rt/chatter' => DDS Writer dd311001d8d322d89b8a0ae200001403 on 'rt/chatter' with type 'std_msgs::msg::dds_::String_'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rt/rosout' => DDS 'rt/rosout'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rt/chatter' => DDS 'rt/chatter'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rt/parameter_events' => zenoh 'rt/parameter_events'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rq/talker/list_parametersRequest' => zenoh 'rq/talker/list_parametersRequest'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rr/talker/list_parametersReply' => DDS 'rr/talker/list_parametersReply'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rq/talker/describe_parametersRequest' => zenoh 'rq/talker/describe_parametersRequest'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rr/talker/describe_parametersReply' => DDS 'rr/talker/describe_parametersReply'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rq/talker/set_parameters_atomicallyRequest' => zenoh 'rq/talker/set_parameters_atomicallyRequest'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rr/talker/set_parameters_atomicallyReply' => DDS 'rr/talker/set_parameters_atomicallyReply'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rq/talker/set_parametersRequest' => zenoh 'rq/talker/set_parametersRequest'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rr/talker/set_parametersReply' => DDS 'rr/talker/set_parametersReply'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rq/talker/get_parameter_typesRequest' => zenoh 'rq/talker/get_parameter_typesRequest'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rr/talker/get_parameter_typesReply' => DDS 'rr/talker/get_parameter_typesReply'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: DDS 'rq/talker/get_parametersRequest' => zenoh 'rq/talker/get_parametersRequest'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rr/talker/get_parametersReply' => DDS 'rr/talker/get_parametersReply'
zenoh        | [2022-11-09T16:09:19Z INFO  zplugin_dds] Remove unused route: zenoh 'rt/parameter_events' => DDS 'rt/parameter_events'
```

## Scenario 2 - Services

Login on VM-1 and run:

```bash
docker exec -it roshumble /bin/bash
source ./ros_entrypoint
ros2 run demo_nodes_cpp add_two_ints_server
```

Login on VM-2 and run

```bash
docker exec -it roshumble /bin/bash
source ./ros_entrypoint
ros2 run demo_nodes_cpp add_two_ints_client_async
```

### Result of the test 2

No success: Service client not getting a response

Logs on Machine1

```bash
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] Ignoring Subscription for resource ros_discovery_info as it is not allowed (see your 'allow' or 'deny' configuration)
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rt/rosout' => DDS Writer dd311001d8d322d89b8a0ae200001503 on 'rt/rosout' with type 'rcl_interfaces::msg::dds_::Log_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] Ignoring Publication for resource ros_discovery_info as it is not allowed (see your 'allow' or 'deny' configuration)
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_client/get_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200001603 on 'rr/add_two_ints_client/get_parametersReply' with type 'rcl_interfaces::srv::dds_::GetParameters_Response_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001704 on 'rq/add_two_ints_client/get_parametersRequest' => zenoh 'rq/add_two_ints_client/get_parametersRequest' with type 'rcl_interfaces::srv::dds_::GetParameters_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_client/get_parameter_typesReply' => DDS Writer dd311001d8d322d89b8a0ae200001803 on 'rr/add_two_ints_client/get_parameter_typesReply' with type 'rcl_interfaces::srv::dds_::GetParameterTypes_Response_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001904 on 'rq/add_two_ints_client/get_parameter_typesRequest' => zenoh 'rq/add_two_ints_client/get_parameter_typesRequest' with type 'rcl_interfaces::srv::dds_::GetParameterTypes_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_client/set_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200001a03 on 'rr/add_two_ints_client/set_parametersReply' with type 'rcl_interfaces::srv::dds_::SetParameters_Response_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001b04 on 'rq/add_two_ints_client/set_parametersRequest' => zenoh 'rq/add_two_ints_client/set_parametersRequest' with type 'rcl_interfaces::srv::dds_::SetParameters_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_client/set_parameters_atomicallyReply' => DDS Writer dd311001d8d322d89b8a0ae200001c03 on 'rr/add_two_ints_client/set_parameters_atomicallyReply' with type 'rcl_interfaces::srv::dds_::SetParametersAtomically_Response_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001d04 on 'rq/add_two_ints_client/set_parameters_atomicallyRequest' => zenoh 'rq/add_two_ints_client/set_parameters_atomicallyRequest' with type 'rcl_interfaces::srv::dds_::SetParametersAtomically_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_client/describe_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200001e03 on 'rr/add_two_ints_client/describe_parametersReply' with type 'rcl_interfaces::srv::dds_::DescribeParameters_Response_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200001f04 on 'rq/add_two_ints_client/describe_parametersRequest' => zenoh 'rq/add_two_ints_client/describe_parametersRequest' with type 'rcl_interfaces::srv::dds_::DescribeParameters_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_client/list_parametersReply' => DDS Writer dd311001d8d322d89b8a0ae200002003 on 'rr/add_two_ints_client/list_parametersReply' with type 'rcl_interfaces::srv::dds_::ListParameters_Response_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200002104 on 'rq/add_two_ints_client/list_parametersRequest' => zenoh 'rq/add_two_ints_client/list_parametersRequest' with type 'rcl_interfaces::srv::dds_::ListParameters_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rt/parameter_events' => DDS Writer dd311001d8d322d89b8a0ae200002203 on 'rt/parameter_events' with type 'rcl_interfaces::msg::dds_::ParameterEvent_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200002304 on 'rt/parameter_events' => zenoh 'rt/parameter_events' with type 'rcl_interfaces::msg::dds_::ParameterEvent_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: zenoh 'rq/add_two_intsRequest' => DDS Writer dd311001d8d322d89b8a0ae200002403 on 'rq/add_two_intsRequest' with type 'example_interfaces::srv::dds_::AddTwoInts_Request_'
zenoh        | [2022-11-09T16:14:29Z INFO  zplugin_dds] New route: DDS Reader dd311001d8d322d89b8a0ae200002504 on 'rr/add_two_intsReply' => zenoh 'rr/add_two_intsReply' with type 'example_interfaces::srv::dds_::AddTwoInts_Response_'
```

Logs on Machine2

```bash
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_server/set_parametersReply' => DDS Writer 493c100133da61eef3f74a3300002603 on 'rr/add_two_ints_server/set_parametersReply' with type 'rcl_interfaces::srv::dds_::SetParameters_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300002704 on 'rq/add_two_ints_server/set_parametersRequest' => zenoh 'rq/add_two_ints_server/set_parametersRequest' with type 'rcl_interfaces::srv::dds_::SetParameters_Request_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] Ignoring Subscription for resource ros_discovery_info as it is not allowed (see your 'allow' or 'deny' configuration)
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rt/rosout' => DDS Writer 493c100133da61eef3f74a3300002803 on 'rt/rosout' with type 'rcl_interfaces::msg::dds_::Log_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_server/get_parametersReply' => DDS Writer 493c100133da61eef3f74a3300002903 on 'rr/add_two_ints_server/get_parametersReply' with type 'rcl_interfaces::srv::dds_::GetParameters_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_server/get_parameter_typesReply' => DDS Writer 493c100133da61eef3f74a3300002a03 on 'rr/add_two_ints_server/get_parameter_typesReply' with type 'rcl_interfaces::srv::dds_::GetParameterTypes_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] Ignoring Publication for resource ros_discovery_info as it is not allowed (see your 'allow' or 'deny' configuration)
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300002b04 on 'rq/add_two_ints_server/get_parametersRequest' => zenoh 'rq/add_two_ints_server/get_parametersRequest' with type 'rcl_interfaces::srv::dds_::GetParameters_Request_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300002c04 on 'rq/add_two_ints_server/get_parameter_typesRequest' => zenoh 'rq/add_two_ints_server/get_parameter_typesRequest' with type 'rcl_interfaces::srv::dds_::GetParameterTypes_Request_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_server/set_parameters_atomicallyReply' => DDS Writer 493c100133da61eef3f74a3300002d03 on 'rr/add_two_ints_server/set_parameters_atomicallyReply' with type 'rcl_interfaces::srv::dds_::SetParametersAtomically_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300002e04 on 'rq/add_two_ints_server/set_parameters_atomicallyRequest' => zenoh 'rq/add_two_ints_server/set_parameters_atomicallyRequest' with type 'rcl_interfaces::srv::dds_::SetParametersAtomically_Request_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_server/describe_parametersReply' => DDS Writer 493c100133da61eef3f74a3300002f03 on 'rr/add_two_ints_server/describe_parametersReply' with type 'rcl_interfaces::srv::dds_::DescribeParameters_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300003004 on 'rq/add_two_ints_server/describe_parametersRequest' => zenoh 'rq/add_two_ints_server/describe_parametersRequest' with type 'rcl_interfaces::srv::dds_::DescribeParameters_Request_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_ints_server/list_parametersReply' => DDS Writer 493c100133da61eef3f74a3300003103 on 'rr/add_two_ints_server/list_parametersReply' with type 'rcl_interfaces::srv::dds_::ListParameters_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300003204 on 'rq/add_two_ints_server/list_parametersRequest' => zenoh 'rq/add_two_ints_server/list_parametersRequest' with type 'rcl_interfaces::srv::dds_::ListParameters_Request_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rt/parameter_events' => DDS Writer 493c100133da61eef3f74a3300003303 on 'rt/parameter_events' with type 'rcl_interfaces::msg::dds_::ParameterEvent_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300003404 on 'rt/parameter_events' => zenoh 'rt/parameter_events' with type 'rcl_interfaces::msg::dds_::ParameterEvent_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: zenoh 'rr/add_two_intsReply' => DDS Writer 493c100133da61eef3f74a3300003503 on 'rr/add_two_intsReply' with type 'example_interfaces::srv::dds_::AddTwoInts_Response_'
zenoh        | [2022-11-09T16:14:25Z INFO  zplugin_dds] New route: DDS Reader 493c100133da61eef3f74a3300003604 on 'rq/add_two_intsRequest' => zenoh 'rq/add_two_intsRequest' with type 'example_interfaces::srv::dds_::AddTwoInts_Request_'
```

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
root@nacho3:/# ros2 run examples_rclpy_minimal_action_client client
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
