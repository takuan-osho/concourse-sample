#!/bin/sh

set -e
set -x

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
  -m /modules.cfg
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
