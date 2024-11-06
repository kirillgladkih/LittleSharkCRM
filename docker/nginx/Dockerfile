FROM nginx:1.27.2-alpine

WORKDIR /var/www/html

COPY ./server.conf /etc/nginx/conf.d/default.conf

RUN set -x ; \
    addgroup -g 82 -S www-data ; \
    adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

EXPOSE 80 81 443