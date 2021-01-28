FROM php:7.3.6-fpm
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN apt-get update && apt-get install -y libmcrypt-dev \
      mysql-client libmagickwand-dev --no-install-recommends \
      && pecl install imagick \
      && docker-php-ext-enable imagick \
      && docker-php-ext-install pdo_mysql \
      && apt-get install -y git

RUN apt-get install -y unzip \
      && apt-get install -y zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer  --version=1.10.16
