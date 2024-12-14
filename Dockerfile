FROM tidair/smurf-roguev6:R3.0.2

# Install the SMURF PCIe card repository
WORKDIR /usr/local/src
RUN git clone https://github.com/slaclab/smurf-pcie.git
WORKDIR smurf-pcie
RUN git checkout v4.0.0
RUN git submodule sync && git submodule update --init --recursive
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/python:${PYTHONPATH}
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/submodules/axi-pcie-core/python:${PYTHONPATH}
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/submodules/surf/python:${PYTHONPATH}

# Add utilities
RUN mkdir -p /usr/local/src/smurf-pcie_utilities
ADD scripts/* /usr/local/src/smurf-pcie_utilities/
ENV PATH /usr/local/src/smurf-pcie_utilities:${PATH}
