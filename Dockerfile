FROM longkey1/gcp:latest

# Add PPA ondrej/php
RUN apt-get -y  install apt-transport-https lsb-release ca-certificates
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get -y update && apt-get -y install \
php7.3 \
php7.3-bcmath \
php7.3-bz2 \
php7.3-cli \
php7.3-curl \
php7.3-dba \
php7.3-enchant \
php7.3-gd \
php7.3-gmp \
php7.3-intl \
php7.3-json \
php7.3-ldap \
php7.3-mbstring \
php7.3-mysql \
php7.3-opcache \
php7.3-pgsql \
php7.3-sqlite3 \
php7.3-tidy \
php7.3-xml \
php7.3-xmlrpc \
php7.3-xsl \
php7.3-zip
RUN php -v

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer
RUN composer --version
