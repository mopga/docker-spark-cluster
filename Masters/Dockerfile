## INSTALL CENTOS
FROM centos:7

## INSTALL JDK 8 BASE PACKAGE
RUN yum update -y && \
    yum install -y  java-1.8.0-openjdk.x86_64

## MISCELANEOUS PACKAGES 
RUN yum update -y && \
    yum install  -y wget tar curl
RUN yum clean all

## DOWNLOAD AND INSTALL SCALA
RUN wget https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz && \
    tar xvf scala-2.11.8.tgz && \
    mv scala-2.11.8 /usr/lib && \
    ln -s /usr/lib/scala-2.11.8 /usr/lib/scala && \
    export PATH=$PATH:/usr/lib/scala/bin && \
    rm -f scala-2.11.8.tgz

NV SPARK_VER=2.3.0

## DOWNLOAD AND INSTALL SPARK
RUN cd / && \
    wget https://archive.apache.org/dist/spark/spark-$SPARK_VER/spark-$SPARK_VER-bin-hadoop2.7.tgz && \
    tar -xvzf spark-$SPARK_VER-bin-hadoop2.7.tgz && \
    mkdir spark && \
    mv spark-$SPARK_VER-bin-hadoop2.7/* /spark && \
    PATH=$PATH:$HOME/bin:/spark/bin && \
    rm -rf spark-$SPARK_VER-bin-hadoop2.7*

COPY master.sh /

CMD ["/bin/bash", "/master.sh"]