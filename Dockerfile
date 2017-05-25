FROM ubuntu:16.04
MAINTAINER Patrick Christensen <pchristensen@precoa.com>

# Based on francarmona/docker-ubuntu16-apache2-php7 with additional libraries included
# https://github.com/francarmona/docker-ubuntu16-apache2-php7/blob/master/Dockerfile

# Environments vars
ENV TERM=xterm

RUN apt-get update
RUN apt-get -y upgrade

# Packages installation
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --fix-missing install apache2 \
      php \
      php-cli \
      php-gd \
      php-json \
      php-mbstring \
      php-xml \
      php-xsl \
      php-zip \
      php-soap \
      php-pear \
      php-mcrypt \
      libapache2-mod-php \
      curl \
      php-curl \
      apt-transport-https \
      nano \
      lynx-cur \
      php-intl \
      php-mysql \
      php-pgsql \
      php-opcache \
      php-ldap \
      php-fpm \
      php-sockets \
      libnotify-bin

RUN a2enmod rewrite ldap
RUN phpenmod mcrypt

# Composer install
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Update the default apache site with the config we created.
ADD config/apache/apache-virtual-hosts.conf /etc/apache2/sites-enabled/000-default.conf
ADD config/apache/apache2.conf /etc/apache2/apache2.conf
ADD config/apache/ports.conf /etc/apache2/ports.conf
ADD config/apache/envvars /etc/apache2/envvars

# Update php.ini
ADD config/php/php.conf /etc/php/7.0/apache2/php.ini

# Init
ADD init.sh /init.sh
RUN chmod 755 /*.sh

# Add phpinfo script for INFO purposes
RUN echo "<?php phpinfo();" >> /var/www/index.php

RUN service apache2 restart

RUN chown -R www-data:www-data /var/www

WORKDIR /var/www/

# Volume
VOLUME /var/www

# Ports: apache2
EXPOSE 80 443

CMD ["/init.sh"]
