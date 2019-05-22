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