FROM phpstorm/php-72-cli-xdebug-27:latest

RUN apt-get update && \
    apt-get install git-all libicu-dev zip  -y && \
    pecl install redis && \
    docker-php-ext-enable redis && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl
RUN printf "# composer php cli ini settings\n\
date.timezone=UTC\n\
memory_limit=-1\n\
" > $PHP_INI_DIR/php-cli.ini

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
COPY --from=composer:latest /docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /app

ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

CMD ["composer"]

