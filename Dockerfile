FROM google/cloud-sdk:latest

RUN apt-get -y install curl

# Install PHP Extensions
RUN apt-get -y install php5-curl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer
