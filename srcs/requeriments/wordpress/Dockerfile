FROM debian:bullseye

RUN apt-get update -y && apt-get install php php-fpm php-mysql -y mariadb-client curl

COPY ./tools/wp-script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-script.sh

WORKDIR /var/www/html/
RUN mkdir -p /run/php \
	&& chmod 755 /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

#ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/bin/wp/wp-cli.phar
#RUN chmod +x /usr/bin/wp/wp-cli.phar

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

#CMD ["tail", "-f", "/dev/null"]

ENTRYPOINT ["/usr/local/bin/wp-script.sh"]

