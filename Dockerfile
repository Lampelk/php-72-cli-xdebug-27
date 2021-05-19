FROM phpstorm/php-72-cli-xdebug-27:latest

RUN apt-get update && \
    apt-get install git-all libicu-dev zip  -y && \
    pecl install redis && \
    docker-php-ext-configure intl && \
    docker-php-ext-configure pdo_mysql && \
    docker-php-ext-install intl && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-enable mysqli && \
    docker-php-ext-enable pdo_mysql && \
    docker-php-ext-enable redis

RUN printf "# composer php cli ini settings\n\
date.timezone=UTC\n\
memory_limit=-1\n\
" >> $PHP_INI_DIR/php-cli.ini

RUN printf "# xdebug/phpstorm php cli ini settings\n\
xdebug.remote_enable=1\n\
xdebug.remote_host=host.docker.internal\n\
" >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY --from=composer:latest /docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

CMD ["composer"]