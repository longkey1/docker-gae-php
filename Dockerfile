FROM google/cloud-sdk:latest

# Fix frontend not set error
ARG DEBIAN_FRONTEND=noninteractive

# Install deploy tools
RUN apt-get -y install curl wget git gettext apt-utils build-essential

# Add PPA ondrej/php
RUN apt-get -y  install apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get -y update && apt-get -y install \
php7.2 \
php7.2-bcmath \
php7.2-bz2 \
php7.2-cli \
php7.2-curl \
php7.2-dba \
php7.2-enchant \
php7.2-gd \
php7.2-gmp \
php7.2-intl \
php7.2-json \
php7.2-ldap \
php7.2-mbstring \
php7.2-mysql \
php7.2-opcache \
php7.2-pgsql \
php7.2-sqlite3 \
php7.2-tidy \
php7.2-xml \
php7.2-xmlrpc \
php7.2-xsl \
php7.2-zip
RUN php -v

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer
RUN composer --version
