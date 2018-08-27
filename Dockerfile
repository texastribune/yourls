FROM php:7.1-apache
MAINTAINER tech@texastribune.org

ENV YOURLS_VERSION 1.7.2
RUN curl -o /tmp/YOURLS-$YOURLS_VERSION.tar.gz -L https://github.com/YOURLS/YOURLS/archive/$YOURLS_VERSION.tar.gz && \
    tar -zxf /tmp/YOURLS-$YOURLS_VERSION.tar.gz --strip-components=1 && \
    rm /tmp/YOURLS-$YOURLS_VERSION.tar.gz && \
    docker-php-ext-install pdo_mysql && \
    a2enmod rewrite && \
    rm *.html *.md *.txt

COPY htaccess .htaccess
COPY index.php ./index.php
COPY config.php ./user/config.php

RUN curl -o /tmp/yourls-bulk-import-and-shorten.tar.gz -L https://github.com/vaughany/yourls-bulk-import-and-shorten/archive/master.tar.gz && tar -zxf /tmp/yourls-bulk-import-and-shorten.tar.gz --directory user/plugins && rm /tmp/yourls-bulk-import-and-shorten.tar.gz

RUN curl -o /tmp/YOURLS-Import-Export.tar.gz -L https://github.com/GautamGupta/YOURLS-Import-Export/archive/master.tar.gz && tar -zxf /tmp/YOURLS-Import-Export.tar.gz --directory user/plugins && rm /tmp/YOURLS-Import-Export.tar.gz
