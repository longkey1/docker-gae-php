FROM debian:latest

RUN apt-get -y update && apt-get -y install curl git wget build-essential lsb-release unzip python-openssl

# Install the Google Cloud SDK.

RUN echo "deb http://packages.cloud.google.com/apt cloud-sdk-$(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/google-cloud-sdk.list
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN apt-get -y update && apt-get -y install google-cloud-sdk

# Install the Google AppEngine SDK for PHP

RUN gcloud components install app-engine-php
