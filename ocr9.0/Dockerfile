From nvidia/cuda:9.2-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN apt-get install libsm6 libxrender1 libxext-dev gcc wget -y
RUN apt-get install vim -y
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN sh -c '/bin/echo -e "\nyes\n\nyes" | sh Miniconda3-latest-Linux-x86_64.sh'
RUN echo -e "\ny" | /root/miniconda3/bin/conda install python=3.6