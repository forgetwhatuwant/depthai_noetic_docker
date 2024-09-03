
# DepthAI Noetic Docker Environment

This repository provides a Docker environment setup for [DepthAI](https://github.com/luxonis/depthai). The environment is based on ROS Noetic and designed to simplify the development and deployment of DepthAI applications.

## Prerequisites

Before using this Docker setup, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/) (optional, if using a `docker-compose.yml` file)

## Getting Started

### 1. Clone the Repository

Start by cloning the repository to your local machine:

```bash
git clone https://github.com/forgetwhatuwant/depthai_noetic_docker.git
cd depthai_noetic_docker
```

### 2. Build the Docker Image

Build the Docker image using the provided Dockerfile. You can customize the image name as needed:

```bash
./build_docker.sh
```

This command will create a Docker image named `depthai_noetic` with the `latest` tag.

### 3. Run the Docker Container

Once the image is built, you can run a container from it. Here are a few options:

#### Option 1: Run with Default Settings

Run the container with default settings:

```bash
./run.sh
```

This command will start an interactive terminal session inside the container.

#### Option 2: Run with ROS and DepthAI Access

To access ROS and DepthAI functionalities inside the container, you can map your workspace and attach necessary devices:

```bash
docker run -it --rm \
    --privileged \
    --env DISPLAY=$DISPLAY \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume $(pwd)/your_workspace:/root/ros_ws \
    --device /dev/video0:/dev/video0 \
    depthai_noetic:latest
```

- `--privileged`: Grants the container access to all devices on the host.
- `--env DISPLAY=$DISPLAY`: Enables GUI applications to run inside the container.
- `--volume /tmp/.X11-unix:/tmp/.X11-unix`: Shares the X11 socket for GUI access.
- `--volume $(pwd)/your_workspace:/root/ros_ws`: Mounts your ROS workspace inside the container.
- `--device /dev/video0:/dev/video0`: Provides access to a specific video device (e.g., a camera).

### 4. Using DepthAI and ROS

After starting the container, you can begin developing with DepthAI and ROS. Here are a few commands to get you started:

#### Sourcing the ROS Workspace

```bash
source /opt/ros/noetic/setup.bash
source /root/ros_ws/devel/setup.bash
```

#### Running a ROS Node

For example, to run a DepthAI ROS node:

```bash
roslaunch depthai_examples rgb_camera.launch
```

### 5. Stopping the Container

To stop the container, simply exit the terminal:

```bash
exit
```

The container will be removed automatically if you used the `--rm` flag.

## Customizing the Dockerfile

If you need to modify the Dockerfile (e.g., to add new dependencies), you can edit the `Dockerfile` located in this repository and rebuild the image using the `docker build` command.

## Troubleshooting

- **Permission Denied Errors**: Ensure you have the necessary permissions to access Docker. If you encounter issues with device access, try running Docker with `sudo`.
- **Display Issues**: If GUI applications do not display correctly, ensure that your system's X server is properly configured and accessible to Docker containers.

## Contributing

Contributions to this repository are welcome. Feel free to submit issues, fork the repository, and create pull requests to improve the Docker setup.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

This README provides a comprehensive guide to using the DepthAI Docker environment. It includes setup instructions, usage examples, and basic troubleshooting tips.