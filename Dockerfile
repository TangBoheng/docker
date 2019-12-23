FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
MAINTAINER tbh "tangboheng@chinamobile.com"

RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  apt-get clean
RUN apt-get update --fix-missing && apt-get install -y curl wget vim net-tools bzip2 git\
  && rm -rf /var/lib/apt/lists/* && mkdir -p /software

WORKDIR /software

RUN wget --quiet https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Miniconda3-latest-Linux-x86_64.sh.sh && \
    /bin/bash ~/Miniconda3-latest-Linux-x86_64.sh -b -p /software/conda && \
    # rm ~/Miniconda3-latest-Linux-x86_64.sh && \
    # ln -s /software/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo "export PATH=/software/conda/bin:$PATH" >> ~/.bashrc 
    # && \
    # echo "conda activate base" >> ~/.bashrc

RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
RUN conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
RUN conda config --set show_channel_urls yes

#RUN /software/conda/bin/conda create -n python3.6 python=3.6 pytorch torchvision -c pytorch\
#&& apt clean \
#&& apt autoremove -y

RUN /software/conda/bin/pip install PyHamcrest \
 && /software/conda/bin/pip install --upgrade pip \
 && /software/conda/bin/pip install msgpack \
 && /software/conda/bin/pip3 install torch torchvision \
# && /software/conda/bin/conda install pytorch torchvision -c pytorch \
 && /software/conda/bin/pip install opencv-python \
 && apt clean \
 && apt autoremove -y


CMD [ "/bin/bash" ]
