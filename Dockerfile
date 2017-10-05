FROM ubuntu:16.04
MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN useradd -ms /bin/bash www

env APACHE_LOCK_DIR /var/lock/apache2

env APACHE_RUN_USER www

env APACHE_RUN_GROUP www

env APACHE_LOG_DIR /var/log/apache2

env APACHE_PID_FILE /var/run/apache2.pid

RUN echo 127.0.0.1 localhost > /etc/hosts

RUN apt-get -y update \
    && apt-get -y install apache2 \
    && apt-get -y install php7.0 libapache2-mod-php7.0 \
    && apt-get -y install php7.0-mysql php7.0-curl php7.0-gd php7.0-intl php-pear php-imagick php7.0-imap php7.0-mcrypt php-memcache  php7.0-pspell php7.0-recode php7.0-sqlite3 php7.0-tidy php7.0-xmlrpc php7.0-xsl php7.0-mbstring php-gettext \
    && apt-get -y install php7.0-opcache php-apcu

RUN echo ServerName localhost > /etc/apache2/conf-available/servername.conf

RUN a2enconf servername && a2enmod rewrite

COPY apache2.conf /etc/apache2/apache2.conf

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
