# lampelk/php-72-cli-xdebug-27
This Docker image is intended for use with PHPStorm as a Project Remote Interpreter.

This is based on the [phpstorm/php-72-cli-xdebug-27](https://hub.docker.com/r/phpstorm/php-72-cli-xdebug-27) image with
[Composer](https://getcomposer.org/) and additional packages & extensions installed:

Packages:

 - `git` - Required for [Composer](https://getcomposer.org/).
 - `libicu-dev` - Required for [`intl` PHP extension](https://www.php.net/manual/en/book.intl.php).
 - `zip` - Required for [Composer](https://getcomposer.org/).

PHP Extensions:
 - `redis` - Required for [`doctrine` caching](https://www.doctrine-project.org/projects/doctrine-orm/en/2.7/reference/caching.html).
 - `intl` - Required for PHPStorm xdebug testing (work in progress).

Notes:
 - [https://stackoverflow.com/questions/48674297/php-intl-extension-in-docker-container](https://stackoverflow.com/questions/48674297/php-intl-extension-in-docker-container)