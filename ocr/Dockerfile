  
From nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN apt-get install  libsm6 libxrender1 libxext-dev gcc wget -y
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN sh -c '/bin/echo -e "\nyes\n\nyes" | sh Miniconda3-latest-Linux-x86_64.sh'
RUN echo -e "\ny" | /root/miniconda3/bin/conda install python=3.6
RUN /root/miniconda3/bin/pip install easydict opencv-contrib-python==3.4.2.16 Cython flask h5py pandas requests bs4 matplotlib lxml -U pillow keras==2.1.5 tensorflow-gpu==1.8 pyinstaller 
RUN /root/miniconda3/bin/pip install web.py==0.40.dev0
RUN echo -e "\ny" | /root/miniconda3/bin/conda install pytorch torchvision -c pytorch
RUN /root/miniconda3/bin/pip install torch-baidu-ctc