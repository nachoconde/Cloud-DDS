# ROS 2 Router actions example

## Example Description

This example uses ROS2 `examples_rclpy_minimal_action_` `client` and `server` each of them in different DDS domains
(`1` and `2` respectively).
Then 2 different DDS Routers run, each of them connecting DDS domains `1` and `2` with the common DDS domain `10`.

```bash
#             Domain 1                Domain 10                Domain 2
#   Action  <---------->  Router 1  <----------->  Router 2  <---------->  Action
#   Client                                                                 Server
```

## Download Vulcanexus Docker image

Download Vulcanexus Docker image from here: https://vulcanexus.org/download

Extract docker image running the following command:

```bash
docker load -i ubuntu-vulcanexus-humble-desktop-2.0.4.tar.gz
```

The Docker compose example runs the `ubuntu-vulcanexus:humble-desktop` image.
Please check that the image name and tag matches the one downloaded.

## Run Docker Compose

Move to this folder and run the following command:

```bash
docker-compose up
```

Just press `Ctrl+C` to close the containers.
