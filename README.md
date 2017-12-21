# Dolibarr with PHP-FPM on Docker

A ready-to-use Docker image is available [on the docker hub](https://hub.docker.com/r/smaccagnoni/dolibarr-phpfpm/). Use `smaccagnoni/dolibarr-phpfpm` as the image name when running a Docker container.

This image provides Dolibarr with PHP-FPM, based on a lightweight Alpine image. Its goals are:

* to provide an image as light as possible
* to be able to use it with NginX instead of Apache

The image preparation process is based on the official Dolibarr dockerfile, with a little bit more security (specifically, files that do not need to be modified are owned by root instead of www-data).

This image is way smaller than an image built with the official Dolibarr (~280MB, vs ~580MB), but does not provide the webserver. To serve Dolibarr, you can use the official nginx:alpine webserver, which is very small too (less than 20 MB).

*YOU NEED AN EXTERNAL WEBSERVER AND AN EXTERNAL MYSQL DATABASE.*

## NginX configuration

This image provides an NginX configuration, which works with the nginx:alpine image. Just use VolumesFrom, and NginX has access to its configuration and its web root.

This configuration assumes the Dolibarr PHP-FPM container is reachable through name "dolibarr" (which can be enforced with a link).

## Documents directory

The documents directory is `/documents`. If you want to keep data between launches of the container, please mount an external volume on this directory.

If you don't use specific templates, this volume may not be mandatory: Dolibarr can regenerate documents afterwards (but it is not an ideal setup).

### Overlay

The documents directory may contain a subdirectory named `overlay`. When such a subdirectory exists, its content is copied on top of the Dolibarr htdocs installation each time the container starts.

## Dolibarr configuration

Dolibarr configuration must be provided with environment variables:

* `URL_ROOT`: URL on which Dolibarr is accessed
* `DB_HOST`: Database hostname
* `DB_PORT`: Dabase port
* `DB_NAME`: Database name
* `DB_USER`: Database username
* `DB_PASS`: Database password
* `COOKIE_CRYPT_KEY`: A random crypt key for the cookies

The crypt key may be generated with the following command:

```
dd if=/dev/urandom bs=1024 count=10 2>/dev/null | md5sum | cut -f1 -d' '
```

## Database configuration

The database and username must exist and must be initialized before starting the container.

In MySQL, execute the following SQL commands:

```
CREATE DATABASE <DB_NAME> CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci';"
GRANT ALL ON <DB_NAME>.* TO '<DB_USER>' IDENTIFIED BY '<DB_PASS>';"
```

Then feed the dump:

```
$ mysql -h <DB_HOST> -u <DB_USER> --password=<DB_PASS> <DB_HOST> < mysql.dump
```

## Default user

Unlike the official install method, this one does not ask you the username and password for the first admin user. Default user/pass for a Dolibarr instance initialized by this container are *admin/nimda*.

IT IS YOUR RESPONSIBILITY TO CHANGE IT UPON YOUR FIRST CONNECTION
