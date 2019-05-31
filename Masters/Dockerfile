## INSTALL CENTOS
FROM centos:6.9

## INSTALL JDK 8
RUN yum update -y && \
    yum install -y  java-1.8.0-openjdk*

## MISCELANEOUS PACKAGES 
RUN yum update -y && \
    yum install  -y sudo wget tar curl python3 py-pip
RUN yum clean all

## DOWNLOAD AND INSTALL SCALA
RUN wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz && \
    tar xvf scala-2.11.8.tgz && \
    mv scala-2.11.8 /usr/lib && \
    ln -s /usr/lib/scala-2.11.8 /usr/lib/scala && \
    export PATH=$PATH:/usr/lib/scala/bin && \
    rm -f scala-2.11.8.tgz

## DOWNLOAD AND INSTALL SPARK 2.3.1
RUN cd / && \
    wget https://archive.apache.org/dist/spark/spark-2.3.1/spark-2.3.1-bin-hadoop2.7.tgz && \
    tar -xvzf spark-2.3.1-bin-hadoop2.7.tgz && \
    mkdir spark && \
    mv spark-2.3.1-bin-hadoop2.7/* /spark && \
    PATH=$PATH:$HOME/bin:/usr/local/spark/bin && \
    rm -f spark-2.3.1-bin-hadoop2.7.tgz

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077 6066

CMD ["/bin/bash", "/master.sh"]