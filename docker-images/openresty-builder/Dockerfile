FROM centos:6.7
MAINTAINER SHIMIZU Taku

# Initial setup
RUN yum -y update && yum clean all
RUN yum -y upgrade && yum clean all

# Dependencies for building OpenResty
RUN yum -y install \
  gcc \
  gcc-c++ \
  perl && \
  yum clean all

# Install nginx-build
RUN yum -y install \
  tar \
  wget && \
  yum clean all
RUN wget https://github.com/cubicdaiya/nginx-build/releases/download/v0.9.1/nginx-build-linux-amd64-0.9.1.tar.gz
RUN tar xvzf nginx-build-linux-amd64-0.9.1.tar.gz
RUN mv nginx-build /usr/bin

# Dependencies for installing fpm
RUN yum -y install \
  rpm-build && \
  yum clean all

# Install RVM with Ruby and fpm
ENV PATH $PATH:/usr/local/rvm/gems/ruby-2.3.0/bin:/usr/local/rvm/gems/ruby-2.3.0@global/bin:/usr/local/rvm/rubies/ruby-2.3.0/bin:/usr/local/rvm/bin
RUN yum -y install which && yum clean all
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby
RUN source /usr/local/rvm/scripts/rvm
RUN gem install fpm -v 1.4.0

# Dependencies for building 3rd party nginx modules
RUN yum -y install \
  openldap-devel \
  git && \
  yum clean all

# Add a config file of nginx 3rd party modules
ADD modules.cfg ./
