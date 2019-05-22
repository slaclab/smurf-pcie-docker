#!/usr/bin/env bash

config_file=$1

if [ ! -f config_file ]; then
	echo "File '${config_file}' not found!"
	exit 1
fi

python3 /usr/local/src/smurf-pcie/software/scripts/PcieLoadConfig.py --yaml ${config_file}