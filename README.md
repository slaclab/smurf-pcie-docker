# Docker image tools for the PCIe card for the SMuRF project

## Description

This docker image, named **smurf-pcie** contains debugging tools for the SMuRF project.

It is based on the **smurf-rogue** docker image and contains the **smurf-pcie** repository.

## Source code

Rogue source code is checked out for the SLAC's github repository https://github.com/slaclab/smurf-pcie.

## How to get the container

To get the docker image, first you will need to install the docker engine in you host OS. Then you can pull a copy by running:

```
docker pull tidair/smurf-pcie:<TAG>
```

Where **<TAG>** represents the specific tagged version you want to use.

## Building the image

When a tag is pushed to this github repository, a new Docker image is automatically built and push to its [Dockerhub repository](https://hub.docker.com/r/tidair/smurf-pcie) using travis.

The resulting docker image is tagged with the same git tag string (as returned by `git describe --tags --always`).

## Using the container

The image can be use to:
- Load new firmware into the PCIe card's FPGA,
- Open the debug GUI,
- Load a new configuration YAML file.


The command to run the container looks something like this:
```
docker run -ti --rm \
    tidair/smurr-pcie:<TAG>
```

This will start a new container. You will be given a shell where you can execute one of the following commands to perform each operation listed above:

### Load new firmware into the PCIe card's FPGA,

You need to have a copy of the primary and secondary MCS files in the host CPU, and mount that directory inside the container as `/shared`. The firmware loading script will look for file in this directory in the container. In order to do that, you need to add the option `-v <local_fw_files_dir>:/shared` to the docker run command, when **local_fw_files_dir** is the local directory in the host CPU where the MCS files are located.

Once you start the container, you can type the command: `load_firmware.sh` on the shell.

### Open the debug GUI,

Once you start the container, you can type the command: `start_gui.sh` on the shell.

### Load a new configuration YAML file.

You need to have a copy of the configuration YAML file in the host CPU, and mount that directory inside the container as `/shared`. In order to do that, you need to add the option `-v <local_yaml_files_dir>:/shared` to the docker run command, when **local_yaml_files_dir** is the local directory in the host CPU where the configuration YAML file is located.

You can also use of the the default configuration files provided by the smurf-pcie repository (**pcie_fsbl_config.yml** or **pcie_rssi_config.yml**), which location inside the container is: `/usr/local/src/smurf-pcie/software/config/`

Once you start the container, you can type the command: `load_configuration.sh <CONFIGURATION_FILE>` on the shell, where:

- If you want to use an user-provided configuration file, then  **CONFIGURATION_FILE** is `/shared/<configuration_file_name>`
- If you want to use on of the configuration provided by the **smurf-pcie** repository, then **CONFIGURATION_FILE** is `/usr/local/src/smurf-pcie/software/config/<configuration_file_name>`