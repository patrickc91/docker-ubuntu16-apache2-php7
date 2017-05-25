# docker-ubuntu16-apache2-php7
A docker image based on Ubuntu 16.04 with Apache2 + PHP 7.0

## Pull the image

Pull the latest stable version from the [Docker Hub Registry](https://hub.docker.com/r/thespincycle/docker-ubuntu16-apache2-php7/)
```
docker pull thespincycle/docker-ubuntu16-apache2-php7:latest
```

If you prefer building the image from source, clone the repository and run docker build

```
git clone https://github.com/patrickc91/docker-ubuntu16-apache2-php7.git
docker build -t thespincycle/docker-ubuntu16-apache2-php7 .
```

## Run

After building the image, run the container.
```
docker run -dP -v ~/project/path:/var/www thespincycle/docker-ubuntu16-apache2-php7
```

Use `docker ps` to determine the host port your application is bound to.

Then browse to [http://localhost:[host-port]](http://localhost:[host-port]) to view your app.

NOTE: If you're using Docker Toolbox, change `localhost` to your toolbox IP (192.168.99.100 on Windows)

## Use as a base image

Some cases will be necessary to create a new image using this one as the base, for example to overwrite configuration files.

Create a Dockerfile with following content and then build the image.

```Dockerfile
FROM thespincycle/docker-ubuntu16-apache2-php7

MAINTAINER Your Name <your@email>

# Apache site conf
ADD config/apache/apache-virtual-hosts.conf /etc/apache2/sites-enabled/000-default.conf
ADD config/apache/apache2.conf /etc/apache2/apache2.conf
```

## Packages included

 * php7.0
 * php7.0-cli
 * apache2
 * php7.0-gd
 * php7.0-json
 * php7.0-mbstring
 * php7.0-xml
 * php7.0-xsl
 * php7.0-zip
 * php7.0-soap
 * php7.0-pear
 * php7.0-mcrypt
 * php7.0-curl
 * php7.0-intl
 * php7.0-mysql
 * php7.0-pgsql
 * php7.0-opcache
 * php7.0-ldap
 * php7.0-fpm
 * php7.0-sockets
 * curl
 * libapacha2-mod-php
 * apt-transport-https
 * nano
 * lynx-cur
 * composer
 * msodbcsql
 * unixodbc-dev-utf16
 * sqlsrv
 * pdo_sqlsrv
 * libnotify-bin

## Exposed ports

80 & 443

## Exposed volumes

 - webroot: `/var/www`
 
## Out of the box

 * Ubuntu 16.04 LTS
 * Apache2
 * PHP7
 * Composer
