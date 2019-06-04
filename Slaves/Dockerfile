## INSTALL CENTOS
FROM centos:6.9

## INSTALL JDK 8 BASE PACKAGE
RUN yum update -y && \
    yum install -y  java-1.8.0-openjdk.x86_64

## MISCELANEOUS PACKAGES.
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

## DOWNLOAD AND INSTALL SPARK 2.3.0
RUN cd / && \
    wget https://archive.apache.org/dist/spark/spark-2.4.3/spark-2.4.3-bin-hadoop2.7.tgz && \
    tar -xvzf spark-2.4.3-bin-hadoop2.7.tgz && \
    mkdir spark && \
    mv spark-2.4.3-bin-hadoop2.7/* /spark && \
    PATH=$PATH:$HOME/bin:/usr/local/spark/bin && \
    rm -f spark-2.4.3-bin-hadoop2.7.tgz

RUN cd / && \
    wget http://central.maven.org/maven2/io/delta/delta-core_2.11/0.1.0/delta-core_2.11-0.1.0.jar && \
    mv delta-core_2.11-0.1.0.jar /spark/jars/

COPY worker.sh /

CMD ["/bin/bash", "/worker.sh"]