FROM php:8.0.8-apache
MAINTAINER tech@texastribune.org

ENV YOURLS_VERSION 1.8.1
RUN curl -o /tmp/YOURLS-$YOURLS_VERSION.tar.gz -L https://github.com/YOURLS/YOURLS/archive/$YOURLS_VERSION.tar.gz && \
    tar -zxf /tmp/YOURLS-$YOURLS_VERSION.tar.gz --strip-components=1 && \
    rm /tmp/YOURLS-$YOURLS_VERSION.tar.gz && \
    docker-php-ext-install pdo_mysql && \
    a2enmod rewrite && \
    rm -f *.html *.md *.txt

COPY htaccess .htaccess
COPY index.php ./index.php
COPY config.php ./user/config.php
