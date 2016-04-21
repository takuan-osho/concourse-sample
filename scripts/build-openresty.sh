#!/bin/sh

set -e
set -x

nginx-build -d work -openresty -openrestyversion=1.9.7.4 -pcre -openssl -zlib
cd work/openresty/1.9.7.4/openresty-1.9.7.4
make install DESTDIR=/tmp/openresty
fpm -s dir -t rpm \
  -v 1.9.7.4 \
  -n openresty \
  -C /tmp/openresty \
  -a x86_64 \
  --description "OpenResty v1.9.7.4" \
  -p openresty-1.9.7.4.rpm \
  .
