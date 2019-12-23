FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04
MAINTAINER tbh "tangboheng@chinamobile.com"

#RUN  sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  apt-get clean
RUN apt-get update --fix-missing && apt-get install -y curl wget vim net-tools bzip2 gcc git\
  && rm -rf /var/lib/apt/lists/* && mkdir -p /software


RUN wget --quiet https://mirrors.tuna.tsinghua.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Miniconda3.sh && \
    /bin/bash ~/Miniconda3.sh -b -p /root/miniconda && \
    rm ~/Miniconda3.sh && \
    # ln -s /root/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo "export PATH=/root/conda/bin:$PATH" >> ~/.bashrc 
    # && \
    # echo "conda activate base" >> ~/.bashrc

#RUN mv /root/miniconda3 /root/conda
#RUN /root/conda/bin/conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
#RUN /root/conda/bin/conda --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge 
#RUN /root/conda/bin/conda --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/msys2/
#RUN /root/conda/bin/conda --set show_channel_urls yes

ADD requirement.txt /root/requirement.txt
RUN ls root/
RUN /root/miniconda3/bin/pip install cython #-i http://mirrors.aliyun.com/pypi/simple/ 
RUN /root/miniconda3/bin/pip install numpy #-i http://mirrors.aliyun.com/pypi/simple/ 
RUN /root/miniconda3/bin/pip install -r /root/requirement.txt #-i http://mirrors.aliyun.com/pypi/simple/ 

CMD [ "/bin/bash" ]
