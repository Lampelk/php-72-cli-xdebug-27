# lampelk/php-72-cli-xdebug-27
This Docker image is intended for use with PHPStorm as a Project Remote Interpreter.

This is based on the [phpstorm/php-72-cli-xdebug-27](https://hub.docker.com/r/phpstorm/php-72-cli-xdebug-27) image with
[Symfony CLI](https://symfony.com/download), [Composer](https://getcomposer.org/) and additional packages & extensions
installed:

Packages:

 - `git` - Required for [Symfony CLI](https://symfony.com/download) & [Composer](https://getcomposer.org/).
 - `libicu-dev` - Required for [`intl` PHP extension](https://www.php.net/manual/en/book.intl.php).
 - `zip` - Required for [Symfony CLI](https://symfony.com/download) & [Composer](https://getcomposer.org/).

PHP Extensions:
 - `redis` - Required for [`doctrine` caching](https://www.doctrine-project.org/projects/doctrine-orm/en/2.7/reference/caching.html).
 - `intl` - Required for PHPStorm xdebug testing (work in progress).

--

## PHPStorm Settings

### PHP CLI Interpreter

Go to `Languages & Frameworks > PHP` and select configure `CLI Interpreter`.

Add a new remote interpreter.

Choose the `lampelk\php-72-cli-xdebug-27` image.

### Composer

Go to `Languages & Frameworks > PHP > Composer`.

Add a new remote interpreter.

Choose the `lampelk\php-72-cli-xdebug-27` image.

### Test Framework

Go to `Languages & Frameworks > PHP > Test Frameworks`.

Add a new `PHPUnit by Remote Interpreter` configuration.

Choose the `lampelk\php-72-cli-xdebug-27` image.

Select `Path to phpunit.phar` and add the following path: `/app/vendor/bin/simple-phpunit`.

Add the following path for `Default configuration file: /app/phpunit.xml.dist`.

Add the following path for `Default bootstrap file: /app/tests/bootstrap.php`.

### Command Line Tools

Go to `Tools >  Command Line Tool Support`.

Add a new `Symfony` Command Line Tool.

Add the following `Tool path: /app/bin/console`.

### Server

Go to `Languages & Frameworks > PHP > Server`.

Add a new server called `localhost`.

### Run/Debug Web Page Configuration

Go to `Run > Edit Configurations`.

Add `PHP Web Page` and select `localhost` server.

--

## Create New Project

### Install Symfony

`docker run -it -v $(pwd):/app lampelk/php-72-cli-xdebug-27 symfony new --full .`

or for basic skeleton app:

`docker run -it -v $(pwd):/app lampelk/php-72-cli-xdebug-27 symfony new .`

### Install PHPUnit

`docker run -it -v $(pwd):/app lampelk/php-72-cli-xdebug-27 /app/vendor/bin/simple-phpunit install`

### Initialise Git

`docker run -it -v $(pwd):/app lampelk/php-72-cli-xdebug-27 git init && git add .`

Notes:
 - [https://stackoverflow.com/questions/48674297/php-intl-extension-in-docker-container](https://stackoverflow.com/questions/48674297/php-intl-extension-in-docker-container)