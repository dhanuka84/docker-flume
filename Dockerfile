#FROM debian:jessie
FROM centos:7
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

ENV JAVA_HOME /opt/java/jdk1.8.0_131
ENV PATH /opt/flume/bin:/opt/java/jdk1.8.0_131/bin:$PATH


# Set up a volume in /var/tmp
VOLUME /var/tmp/sink

RUN mkdir /opt/java 
RUN curl -L -b "oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz -O
#RUN rpm -ivh  jdk-8u191-linux-x64.rpm
RUN tar -zxf  jdk-8u131-linux-x64.tar.gz  -C /opt/java
ENV JAVA_HOME /opt/java/jdk1.8.0_131

RUN yum update -y && \
    yum install -y nc unzip wget which && \
    yum clean all

RUN mkdir /opt/flume \
    && curl -s -L http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz -o apache-flume-1.8.0-bin.tar.gz

RUN tar zxf apache-flume-1.8.0-bin.tar.gz  -C /opt/flume --strip-components=1 



#UN apt-get update -qq \ 
 #  && apt-get install -q -y --no-install-recommends wget \
  # && mkdir /opt/java \ 
   #&& wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- \
    #     http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jre-8u171-linux-x64.tar.gz \
     #    | tar zxvf - -C /opt/java --strip 1 \
   #&& mkdir /opt/flume \ 
   #&& wget -qO- http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz \
    #     | tar zxvf - -C /opt/flume --strip 1

ADD start-flume.sh /opt/flume/bin/start-flume

ENTRYPOINT [ "start-flume" ]
