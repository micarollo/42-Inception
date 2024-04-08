FROM debian:bullseye

RUN apt-get update
RUN apt-get install nginx openssl --no-install-recommends --no-install-suggests -y

RUN openssl req -x509 -sha256 -nodes -out /etc/ssl/certs/inception.crt -keyout /etc/ssl/certs/inception.key -subj "/C=ES/ST=CAT/L=BCN/O=mrollo.42.fr/CN=mrollo"

COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
