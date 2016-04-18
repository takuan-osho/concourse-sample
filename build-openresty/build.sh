#!/bin/sh

set -e
set -x

nginx-build -d work -openresty -pcre -openssl -zlib
