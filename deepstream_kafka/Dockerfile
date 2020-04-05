FROM nvcr.io/nvidia/deepstream:4.0.2-19.12-devel
LABEL maintainer="Tangboheng"
ADD ./zoo.cfg /root/zoo.cfg 
ADD ./server.properties /root/server.properties

RUN apt-get update && apt-get install -y openjdk-8-jdk && apt-get install -y wget \
    && apt-get install -y libglib2.0 libglib2.0-dev libjansson4  libjansson-dev librdkafka1=0.11.3-1build1 \
    && mkdir -p /root/mq/data && mkdir -p /root/mq/log-1 \
    && wget https://downloads.apache.org/zookeeper/zookeeper-3.6.0/apache-zookeeper-3.6.0-bin.tar.gz \
    && tar -zxvf apache-zookeeper-3.6.0-bin.tar.gz -C /root/mq\
    && rm apache-zookeeper-3.6.0-bin.tar.gz \
    && wget https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.4.1/kafka_2.12-2.4.1.tgz  \
    && tar -zxvf kafka_2.12-2.4.1.tgz -C /root/mq\
    && rm kafka_2.12-2.4.1.tgz \
    && rm /root/mq/kafka_2.12-2.4.1/config/server.properties

RUN mv /root/zoo.cfg /root/mq/apache-zookeeper-3.6.0-bin/conf/ 
RUN mv /root/server.properties /root/mq/kafka_2.12-2.4.1/config/

RUN /root/mq/apache-zookeeper-3.6.0-bin/bin/zkServer.sh start 
RUN /root/mq/kafka_2.12-2.4.1/bin/kafka-server-start.sh -daemon /root/mq/kafka_2.12-2.4.1/config/server.properties 
#RUN cd /root/mq/kafka_2.12-2.4.1 && ./bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
CMD [ "/bin/bash" ]