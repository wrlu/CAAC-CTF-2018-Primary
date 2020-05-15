FROM php:7.0-apache

MAINTAINER tl

ENV REFRESHED_AT 2018‐08‐03

ENV LANG C.UTF‐8

COPY index.php /var/www/html/index.php
COPY style.css /var/www/html/style.css
RUN mkdir /var/www/html/images
COPY images/* /var/www/html/images/

EXPOSE 80
