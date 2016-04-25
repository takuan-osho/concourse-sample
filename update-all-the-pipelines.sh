#!/bin/bash

# Update docker-images pipeline.
fly sp -t sample -c pipelines/openresty-builder.yml -p docker-images -l config/credentials.yml -n
fly up -t sample -p docker-images

# Update build-openresty pipeline.
fly sp -t sample -c pipelines/build-openresty.yml -p build-openresty -l config/credentials.yml -l config/versions.yml -n
fly up -t sample -p build-openresty
