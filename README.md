# docker-php-apache

# MySQL

    docker pull mysql:5.7.19

    mkdir -p /root/web/mysql

    docker run -e MYSQL_ROOT_PASSWORD='your password' -d -p 127.0.0.1:3306:3306 --name mysql-5.7.19 -v /root/web/mysql:/var/lib/mysql mysql:5.7.19

    docker stop mysql-5.7.19

    docker rm mysql-5.7.19

    docker run -d --restart=always -p 127.0.0.1:3306:3306 --name mysql-5.7.19 -v /root/web/mysql:/var/lib/mysql mysql:5.7.19

# apache with php on alpine

    docker pull ilanyu/php-apache:alpine-xdebug

    docker run -d --restart=always --link mysql-5.7.19:mysql -p 8081:80 --name www.lanyus.com -v /root/web/www/www.lanyus.com:/var/www/html ilanyu/php-apache:alpine-xdebug
