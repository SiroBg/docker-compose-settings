FROM php:8.3.28-fpm
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
