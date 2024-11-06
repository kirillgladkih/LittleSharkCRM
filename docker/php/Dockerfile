FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

RUN apk add --no-cache \
	libpq-dev \
	openldap-dev \
	oniguruma-dev \
	libzip-dev \
	freetype-dev \
	imagemagick-dev \
    icu-dev \
	&& docker-php-ext-install pdo pgsql pdo_pgsql mbstring zip ldap pcntl opcache bcmath \
	&& docker-php-ext-configure intl \
    && docker-php-ext-install intl

COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && apk add --update linux-headers \
    && pecl install xdebug-3.3.2 \
    && docker-php-ext-enable xdebug \
    && apk del -f .build-deps

RUN apk add shadow

RUN groupmod -o -g 1000 www-data && \
    usermod -o -u 1000 -g www-data www-data

USER www-data

CMD ["php-fpm"]

EXPOSE 9000