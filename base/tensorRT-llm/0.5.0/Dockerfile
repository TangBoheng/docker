FROM nvcr.io/nvidia/cuda:12.4.0-devel-ubuntu22.04
RUN apt-get update && apt-get -y install python3.10 python3-pip openmpi-bin libopenmpi-dev git git-lfs
RUN pip3 install tensorrt_llm -U --pre --extra-index-url https://pypi.nvidia.com
CMD [ "/bin/bash" ]