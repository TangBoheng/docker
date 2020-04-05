FROM nvcr.io/nvidia/deepstream:4.0.2-19.12-devel
LABEL maintainer="Tangboheng"
RUN apt-get update && apt-get install -y openjdk-8-jdk && apt-get install -y wget
RUN mkdir -p /root/mq/data && mkdir -p /root/mq/log-1
RUN wget https://downloads.apache.org/zookeeper/zookeeper-3.6.0/apache-zookeeper-3.6.0-bin.tar.gz \
    && tar -zxvf apache-zookeeper-3.6.0-bin.tar.gz -C /root/mq\
    && rm apache-zookeeper-3.6.0-bin.tar.gz
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/kafka/2.4.1/kafka_2.12-2.4.1.tgz  \
    && tar -zxvf kafka_2.12-2.4.1.tgz -C /root/mq\
    && rm kafka_2.12-2.4.1.tgz \
    && rm /root/mq/kafka_2.12-2.4.1/config/server.properties
RUN ls
COPY ./conf/zoo.cfg /root/mq/apache-zookeeper-3.6.0-bin/conf/ \
    && ./conf/server.properties /root/mq/kafka_2.12-2.4.1/config/
RUN /root/mq/apache-zookeeper-3.6.0-bin/bin/zkServer.sh start \
    && /root/mq/kafka_2.12-2.4.1/bin/kafka-server-start.sh config/server.properties \
    && /root/mq/kafka_2.12-2.4.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test