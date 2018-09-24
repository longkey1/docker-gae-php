FROM google/cloud-sdk:latest

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# Install deploy tools
RUN apt-get -y update && apt-get -y install curl git gettext apt-utils build-essential wget

# Add PPA ondrej/php
RUN apt-get -y  install apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

# Install php
RUN apt-get -y update && apt-get -y install php5.6

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer
