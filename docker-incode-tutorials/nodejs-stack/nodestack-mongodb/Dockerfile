# DOCKER-VERSION 0.5.1

# to build run `docker build -t broartem/nodestack-mongodb .`

FROM    centos:6.4

# Enable MongoDB repository
ADD     ./mongodb.repo /etc/yum.repos.d/mongodb.repo
RUN     yum -y update

RUN     yum -y install mongo-10gen mongo-10gen-server

RUN     service mongod start
RUN     chkconfig mongod on

EXPOSE  27017