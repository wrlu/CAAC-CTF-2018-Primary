FROM ubuntu:16.04
MAINTAINER wrlu
ENV REFRESHED_AT 2018-08-05
ENV LANG C.UTF-8
RUN apt-get update -y
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y install mysql-server
RUN apt-get -yqq install wget
RUN apt-get -yqq install openjdk-8-jre
RUN wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.5.32/bin/apache-tomcat-8.5.32.tar.gz
RUN tar -xzf apache-tomcat-8.5.32.tar.gz -C /root
RUN mv /root/apache-tomcat-8.5.32 /root/tomcat
RUN rm -rf /root/tomcat/webapps/*
COPY CAAC-SQL-Injection.war /root/tomcat/webapps/
COPY wafwtf.sql /root/
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
ENTRYPOINT cd /root; ./start.sh
EXPOSE 8080