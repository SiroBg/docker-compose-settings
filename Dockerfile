FROM php:8.3.28-fpm-alpine3.21
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
