FROM nvidia/cuda:9.0-runtime-ubuntu16.04
LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"
ENV CUDNN_VERSION 7.6.4.38
LABEL com.nvidia.cudnn.version="${CUDNN_VERSION}"
#RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  apt-get clean
RUN apt-get update --fix-missing && apt-get install -y curl wget net-tools bzip2 gcc
RUN apt-get install -y --no-install-recommends \
    libcudnn7=$CUDNN_VERSION-1+cuda9.0 \
&& \
    apt-mark hold libcudnn7 && \
    rm -rf /var/lib/apt/lists/*

    
RUN wget --quiet https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Miniconda3.sh && \
    /bin/bash ~/Miniconda3.sh -b -p /root/miniconda && \
    rm ~/Miniconda3.sh && \
    # ln -s /root/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo "export PATH=/root/miniconda/bin:$PATH" >> ~/.bashrc 
    # && \
    # echo "conda activate base" >> ~/.bashrc

#RUN mv /root/miniconda3 /root/conda
#RUN /root/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
#RUN /root/conda/bin/conda --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
#RUN /root/conda/bin/conda --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
#RUN /root/conda/bin/conda --set show_channel_urls yes

ADD requirement.txt /root/requirement.txt
RUN /root/miniconda/bin/pip install cython==0.29.13 #-i http://mirrors.aliyun.com/pypi/simple/ 
RUN /root/miniconda/bin/pip install numpy==1.17.2 #-i http://mirrors.aliyun.com/pypi/simple/ 
RUN /root/miniconda/bin/pip install -r /root/requirement.txt #-i http://mirrors.aliyun.com/pypi/simple/ 

CMD [ "/bin/bash" ]
