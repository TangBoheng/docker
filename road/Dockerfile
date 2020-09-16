From nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
RUN apt-get update
RUN apt-get install  libsm6 libxrender1 libxext-dev gcc wget -y
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN sh -c '/bin/echo -e "\nyes\n\nyes" | sh Miniconda3-latest-Linux-x86_64.sh'
RUN echo -e "\ny" | /root/miniconda3/bin/conda install python=3.6
RUN /root/miniconda3/bin/conda install -yc anaconda numpy opencv matplotlib tqdm pillow ipython
RUN /root/miniconda3/bin/conda install -yc conda-forge scikit-image pycocotools tensorboard
RUN /root/miniconda3/bin/conda install -yc spyder-ide spyder-line-profiler
RUN /root/miniconda3/bin/conda install -yc pytorch pytorch torchvision
RUN /root/miniconda3/bin/conda install -yc conda-forge protobuf numpy && pip install onnx