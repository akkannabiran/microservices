#!/usr/bin/env bash

# This script is called by dev tools to load category data into elasticsearch.

while ! timeout 1 echo > /dev/tcp/elasticsearch/9200; do sleep 5; echo 'Waiting for elasticsearch service to start-up...'; done;

logstash -f ./bgdev-setup/elasticsearch/config/logstash-category-file-to-es.conf < ./bgdev-setup/elasticsearch/data/category.txt;
logstash -f ./bgdev-setup/elasticsearch/config/logstash-leftnav-file-to-es.conf < ./bgdev-setup/elasticsearch/data/leftnav.txt;
