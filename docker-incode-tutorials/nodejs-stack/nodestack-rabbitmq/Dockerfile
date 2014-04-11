# DOCKER-VERSION 0.5.1

FROM    centos:6.4

# Enable EPEL for Erlang
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
RUN     yum install erlang

RUN     rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc 
        yum install rabbitmq-server-3.2.4-1.noarch.rpm

RUN     chkconfig rabbitmq-server on
RUN     /sbin/service rabbitmq-server start

EXPOSE  5672