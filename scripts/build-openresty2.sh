#!/bin/sh

set -e
set -x

# Initial setup
yum -y update
yum -y upgrade

# Dependencies for building OpenResty
yum -y install \
  gcc \
  gcc-c++ \
  perl

# Install nginx-build
yum -y install \
  tar \
  wget
wget https://github.com/cubicdaiya/nginx-build/releases/download/v0.9.1/nginx-build-linux-amd64-0.9.1.tar.gz
tar xvzf nginx-build-linux-amd64-0.9.1.tar.gz
chmod 755 nginx-build
mv nginx-build /usr/bin

# Dependencies for installing fpm
yum -y install \
  rpm-build

# Install RVM with Ruby and fpm
export PATH=$PATH:/usr/local/rvm/gems/ruby-2.3.0/bin:/usr/local/rvm/gems/ruby-2.3.0@global/bin:/usr/local/rvm/rubies/ruby-2.3.0/bin:/usr/local/rvm/bin
yum -y install which
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby
source /usr/local/rvm/scripts/rvm
gem install fpm -v 1.4.0

# Dependencies for building 3rd party nginx modules
yum -y install \
  openldap-devel \
  git

export CWD=$PWD
nginx-build -d work \
  -openresty \
  -openrestyversion=${OPENRESTY_VERSION} \
  -pcre \
  -pcreversion=${PCRE_VERSION} \
  -openssl \
  -opensslversion=${OPENSSL_VERSION} \
  -zlib \
  -zlibversion=${ZLIB_VERSION} \
  -m ./worker-source/dockerfiles/openresty-builder/modules.cfg
cd work/openresty/${OPENRESTY_VERSION}/openresty-${OPENRESTY_VERSION}
make install DESTDIR=/tmp/openresty
cd $CWD
fpm -s dir -t rpm \
  -v ${OPENRESTY_VERSION} \
  -n openresty \
  -C /tmp/openresty \
  -a x86_64 \
  --description "OpenResty" \
  -p ${OUTPUTS_NAME}/openresty-${OPENRESTY_VERSION}.rpm
