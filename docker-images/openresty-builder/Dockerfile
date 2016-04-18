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
CMD ["wget", "https://github.com/cubicdaiya/nginx-build/releases/download/v0.9.1/nginx-build-linux-amd64-0.9.1.tar.gz"]
CMD ["tar", "xvf", "nginx-build-linux-amd64-0.9.1.tar.gz"]
CMD ["mv", "nginx-build", "/usr/bin"]
