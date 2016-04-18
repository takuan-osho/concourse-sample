FROM alpine
MAINTAINER SHIMIZU Taku

RUN apk update && apk upgrade $$ apk add \
  tar \
  make \
  g++ \
  wget \
  perl && \
  rm -rf /var/cache/apk/*
ADD ./nginx-build /bin
