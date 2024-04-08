FROM debian:bullseye

RUN apt update -y
RUN apt install php-fpm php-mysql -y

COPY ./tools/wp-script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/wp-script.sh

WORKDIR /var/www/html/
RUN mkdir -p /run/php \
	&& chmod 755 /run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

EXPOSE 9000

#CMD ["tail", "-f", "/dev/null"]

ENTRYPOINT ["/usr/local/bin/wp-script.sh"]

