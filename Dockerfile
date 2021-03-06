FROM wordpress:4.8-apache
USER root
ADD   ssl-cert-snakeoil.pem /etc/ssl/certs/
ADD   ssl-cert-snakeoil.key /etc/ssl/private/
RUN echo "define('FORCE_SSL_LOGIN',tRUE);" >> /var/www/html/wp-config.php
RUN echo "define('FORCE_SSL_ADMIN',tRUE);" >> /var/www/html/wp-config.php
RUN a2enmod ssl
RUN a2ensite default-ssl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

#RUN service apache2 reload
