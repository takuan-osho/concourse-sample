fly sp -t sample -c pipeline.yml -p build-openresty -l credentials.yml -n
fly up -t sample -p build-openresty
curl http://192.168.100.4:8080/pipelines/build-openresty/jobs/job-publish-docker-image-building-openresty -X POST
