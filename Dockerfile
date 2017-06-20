FROM google/cloud-sdk:latest

# Install composer
RUN apk --no-cache add php5-curl php5-phar php5-json php5-openssl
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin
RUN mv /usr/local/bin/composer.phar /usr/local/bin/composer

# Install deploy tools
RUN apk --no-cache add git
