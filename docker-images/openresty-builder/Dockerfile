FROM centos:6.7
MAINTAINER SHIMIZU Taku

RUN yum -y update && yum clean all
RUN yum -y upgrade && yum clean all
RUN yum -y install \
  gcc \
  gcc-c++ \
  perl \
  tar \
  wget && \
  yum clean all
ADD ./nginx-build /usr/bin
