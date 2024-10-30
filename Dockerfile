FROM tidair/smurf-rogue:R2.4.2

# Install the SMURF PCIe card repository
WORKDIR /usr/local/src
RUN git clone https://github.com/slaclab/smurf-pcie.git
WORKDIR smurf-pcie
RUN git checkout v3.3.1
RUN sed -i -e 's|git@github.com:|https://github.com/|g' .gitmodules
RUN git submodule sync && git submodule update --init --recursive
ENV PYTHONPATH /usr/local/src/smurf-pcie/software/python:${PYTHONPATH}
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/submodules/axi-pcie-core/python:${PYTHONPATH}
ENV PYTHONPATH /usr/local/src/smurf-pcie/firmware/submodules/surf/python:${PYTHONPATH}

## Patch PcieGui script in v3.3.1 to use PyDM
RUN mkdir -p patches
ADD patches/* patches/
RUN git apply patches/PcieGui.patch
COPY new_python/PcieEpics.py software/scripts/

# Add utilities
RUN mkdir -p /usr/local/src/smurf-pcie_utilities
ADD scripts/* /usr/local/src/smurf-pcie_utilities/
ENV PATH /usr/local/src/smurf-pcie_utilities:${PATH}
