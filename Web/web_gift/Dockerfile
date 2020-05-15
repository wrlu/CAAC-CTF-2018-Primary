FROM php:7.0-apache

MAINTAINER jack

ENV REFRESHED_AT 2018‐08‐03

ENV LANG C.UTF‐8

COPY index.html /var/www/html/index.html
COPY flag.php /var/www/html/flag.php
COPY flag.php.bak /var/www/html/flag.php.bak
RUN chown root:root /var/www/html/flag.php

EXPOSE 80
