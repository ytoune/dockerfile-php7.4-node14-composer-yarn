FROM php:7.4-apache

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1

RUN (curl -sL https://deb.nodesource.com/setup_14.x | bash) && \
  apt-get update && \
  apt-get install -y git nodejs libicu-dev libpng-dev libzip-dev && \
  a2enmod rewrite && \
  docker-php-ext-install gd pdo_mysql intl bcmath zip && \
  service apache2 restart && \
  (curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer) && \
  npm i -g yarn
