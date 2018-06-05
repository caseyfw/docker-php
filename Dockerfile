FROM caseyfw/apache

RUN apk --update --no-cache add php7-apache2 curl php7-json php7-phar php7-openssl php7-ctype php7-mbstring php7-pdo_mysql php7-xml php7-zlib && \
ln -s /usr/bin/php7 /usr/local/bin/php && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
mkdir -p /code/web && chown -R apache:apache /code && rm -rf /web && ln -s /code/web /web && \
echo "Success."

ADD apache2-foreground.sh /apache2-foreground.sh
RUN chmod 755 /apache2-foreground.sh

WORKDIR /code
ENTRYPOINT ["/apache2-foreground.sh"]
