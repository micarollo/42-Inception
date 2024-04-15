FROM debian:bullseye

RUN apt-get update -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d

COPY tools/mariadb.sh /usr/local/bin
RUN chmod +x /usr/local/bin/mariadb.sh

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]
CMD [ "mysqld" ]
