FROM alpine:latest

MAINTAINER ilanyu <lanyu19950316@gmail.com>

RUN apk update && apk upgrade && \
apk add apache2 apache2-utils php7-apache2 php7 && \
apk add php7-intl php7-openssl php7-dba php7-sqlite3 php7-pear php7-litespeed php7-gmp php7-pdo_mysql php7-pcntl php7-xsl php7-fpm php7-imagick php7-mysqlnd php7-enchant php7-pspell php7-redis php7-snmp php7-fileinfo php7-mbstring php7-pear-mail_mime php7-xmlrpc php7-xmlreader php7-pear-mdb2_driver_mysql php7-pdo_sqlite php7-exif php7-recode php7-opcache php7-ldap php7-posix php7-pear-net_socket php7-session php7-gd php7-gettext php7-mailparse php7-json php7-xml php7-iconv php7-sysvshm php7-curl php7-shmop php7-odbc php7-phar php7-pdo_pgsql php7-imap php7-pear-mdb2_driver_pgsql php7-pdo_dblib php7-pgsql php7-pdo_odbc php7-zip php7-cgi php7-ctype php7-amqp php7-mcrypt php7-wddx php7-pear-net_smtp php7-bcmath php7-calendar php7-tidy php7-dom php7-sockets php7-zmq php7-memcached php7-soap php7-apcu php7-sysvmsg php7-zlib php7-embed php7-ftp php7-sysvsem php7-pear-net_idna2 php7-pdo php7-bz2 php7-mysqli php7-simplexml php7-xmlwriter php7-tokenizer && \
rm -rf /var/cache/apk/* && \
sed -i 's#AllowOverride [Nn]one#AllowOverride All#' /etc/apache2/httpd.conf && \
sed -i 's/Options Indexes/Options /g' /etc/apache2/httpd.conf && \
sed -i 's/^#ServerName.*/ServerName 127.0.0.1:80/' /etc/apache2/httpd.conf && \
sed -i 's/^#LoadModule rewrite_module.*/LoadModule rewrite_module modules\/mod_rewrite.so/' /etc/apache2/httpd.conf && \
sed -i 's#PidFile "/run/.*#PidFile "/var/www/httpd.pid"#' /etc/apache2/conf.d/mpm.conf && \
sed -i 's#/var/www/localhost/htdocs#/var/www/html#' /etc/apache2/httpd.conf && \
sed -i 's#/var/www/localhost/cgi-bin#/var/www/cgi-bin#' /etc/apache2/httpd.conf

VOLUME /var/www/html

WORKDIR /var/www/html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
