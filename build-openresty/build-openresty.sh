#!/bin/sh

wget https://github.com/cubicdaiya/nginx-build/releases/download/v0.8.0/nginx-build-linux-amd64-0.8.0.tar.gz
tar xvzf nginx-build-linux-amd64-0.8.0.tar.gz
./nginx-build -d work -openresty -pcre -openssl -zlib
