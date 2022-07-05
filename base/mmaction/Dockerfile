ARG PYTORCH="1.7.0"
ARG CUDA="11.0"
ARG CUDNN="8"

FROM pytorch/pytorch:${PYTORCH}-cuda${CUDA}-cudnn${CUDNN}-devel

ENV TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0+PTX"
ENV TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
ENV CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"
ENV FORCE_CUDA="1"
RUN apt-get update && apt-get install -y git ninja-build libglib2.0-0 libsm6 libxrender-dev libxext6 ffmpeg vim openssh-server gcc gdb gdbserver
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* 

RUN pip install openmim numpy opencv-python==3.4.2.17 cython==0.20 einops -no-cache-dir 

RUN mim install mmcv-full==1.4.0 && mim install mmdet mmpose
    
RUN git clone https://github.com/open-mmlab/mmaction2.git /mmaction2 \
    && mkdir -p /mmaction2/data \
    && conda clean --all \
    && pip install --no-cache-dir -e /mmaction2 \
    && rm -rf /mmaction2






