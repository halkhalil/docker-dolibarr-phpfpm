FROM php:fpm-alpine

RUN apk update && apk add libpng-dev libjpeg-turbo-dev openldap-dev libpng libjpeg-turbo libldap \
        && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
        && docker-php-ext-install gd \
        && docker-php-ext-configure ldap --with-libdir=lib/ \
        && docker-php-ext-install ldap \
        && docker-php-ext-install mysqli \
        && apk del libpng-dev libjpeg-turbo-dev openldap-dev \
        && rm /var/cache/apk/*

ADD htdocs.tar.gz /var/www/html/
RUN mkdir /var/www/html/documents
RUN chown -hR root:root /var/www/html
RUN chown www-data:www-data /var/www/html/documents

VOLUME /var/www/html
