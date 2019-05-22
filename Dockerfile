FROM tidair/smurf-rogue:R1.0.1

# Install the SMURF PCIe card repository
WORKDIR /usr/local/src
RUN git clone https://github.com/slaclab/smurf-pcie.git
WORKDIR smurf-pcie
RUN sed -i -e 's|git@github.com:|https://github.com/|g' .gitmodules
RUN git submodule sync && git submodule update --init --recursive
ENV PYTHONPATH /usr/local/src/smurf-pcie/software/python:${PYTHONPATH}
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/submodules/axi-pcie-core/python:${PYTHONPATH}
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/submodules/surf/python:${PYTHONPATH}

# Add utilities
RUN mkdir -p /usr/local/src/smurf-pcie_utilities
ADD scripts/* /usr/local/src/smurf-pcie_utilities/
ENV PATH /usr/local/src/smurf-pcie_utilities:${PATH}