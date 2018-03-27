FROM alpine

RUN apk --update --no-cache add php7-apache2 curl php7-json php7-phar php7-openssl php7-ctype php7-mbstring php7-pdo_mysql php7-zlib && \
mkdir -p /run/apache2 && ln -s /usr/bin/php7 /usr/local/bin/php && \
curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
mkdir -p /code/web && chown -R apache:apache /code && \
sed -i 's#^DocumentRoot ".*#DocumentRoot "/code/web"#g' /etc/apache2/httpd.conf && \
sed -i 's#^<Directory ".*htdocs.*#<Directory "/code/web">#' /etc/apache2/httpd.conf && \
sed -i 's/AllowOverride [Nn]one/AllowOverride All/' /etc/apache2/httpd.conf && \
sed -i 's/Require all denied/Require all granted/' /etc/apache2/httpd.conf && \
sed -i 's#logs/.*\.log#/dev/stdout#g' /etc/apache2/httpd.conf && \
echo 'Alias "${WEB_PATH}" /web' >> /etc/apache2/httpd.conf && \
echo "Success."

ADD apache2-foreground.sh /apache2-foreground.sh
RUN chmod 755 /apache2-foreground.sh

EXPOSE 80
WORKDIR /code
ENTRYPOINT ["/apache2-foreground.sh"]
