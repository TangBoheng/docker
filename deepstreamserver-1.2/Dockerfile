FROM nvcr.io/nvidia/deepstream:4.0.2-19.12-devel
LABEL maintainer="Tangboheng"

RUN apt-get update && apt-get install -y openjdk-8-jdk && apt-get install -y wget \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libjansson4  libjansson-dev librdkafka1 xrdp vnc4server openssh-server g++ gdb gdbserver libglib2.0 libglib2.0-dev \
    && service xrdp restart

CMD [ "/bin/bash" ]