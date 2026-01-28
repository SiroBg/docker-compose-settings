FROM php:8.5.2-fpm-alpine3.22

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN apk update && apk add --no-cache libzip-dev unzip && docker-php-ext-install zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the application code
COPY ./src/composer.json ./src/composer.lock ./

# Run composer install to fetch dependencies
RUN composer update
RUN composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev


