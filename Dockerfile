ARG DOCKER_REGISTRY=docker.io
ARG FROM_IMG_REPO=qnib
ARG FROM_IMG_NAME="uplain-corretto-jdk"
ARG FROM_IMG_TAG="11.0.4.11-1"
ARG FROM_IMG_HASH=""
FROM ${DOCKER_REGISTRY}/${FROM_IMG_REPO}/${FROM_IMG_NAME}:${FROM_IMG_TAG}${DOCKER_IMG_HASH}

RUN apt-get update \
 && apt-get install -y gnupg2 \
 && wget -qO - https://d3g5vo6xdbdb9a.cloudfront.net/GPG-KEY-opendistroforelasticsearch | apt-key add -
RUN echo "deb https://d3g5vo6xdbdb9a.cloudfront.net/apt stable main" | tee -a   /etc/apt/sources.list.d/opendistroforelasticsearch.list
RUN wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-oss-7.1.1-amd64.deb \
 && dpkg -i elasticsearch-oss-7.1.1-amd64.deb \
 && rm -f elasticsearch-oss-7.1.1-amd64.deb
RUN apt-get update \
 && apt-get install -y opendistroforelasticsearch=1.1.0-1