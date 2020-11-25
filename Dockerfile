FROM phpstorm/php-72-cli-xdebug-27

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
