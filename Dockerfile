# Build image
FROM node:8.11.2

LABEL description="copay build"
LABEL version="1.0"
LABEL maintainer "holdstockjamie@gmail.com"

USER root
WORKDIR /root

COPY ./ /root

RUN npm install -g grunt

RUN npm install
