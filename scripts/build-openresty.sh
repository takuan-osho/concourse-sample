#!/bin/sh

set -e
set -x

nginx-build -d work \
  -openresty \
  -openrestyversion=${OPENRESTY_VERSION} \
  -pcre \
  -pcreversion=${PCRE_VERSION} \
  -openssl \
  -opensslversion=${OPENSSL_VERSION} \
  -zlib \
  -zlibversion=${ZLIB_VERSION}
cd work/openresty/${OPENRESTY_VERSION}/openresty-${OPENRESTY_VERSION}
make install DESTDIR=/tmp/openresty
fpm -s dir -t rpm \
  -v ${OPENRESTY_VERSION} \
  -n openresty \
  -C /tmp/openresty \
  -a x86_64 \
  --description "OpenResty" \
  -p openresty-${OPENRESTY_VERSION}.rpm \
  .
