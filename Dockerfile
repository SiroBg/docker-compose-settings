FROM php:8.3.28-fpm

RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

RUN apt-get update && apt-get install -y libzip-dev unzip && docker-php-ext-install zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy the application code
COPY ./src/composer.json ./src/composer.lock ./

# Run composer install to fetch dependencies
RUN composer install --prefer-dist --no-interaction --optimize-autoloader --no-dev


