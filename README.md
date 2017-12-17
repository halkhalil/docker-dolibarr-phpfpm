# Dolibarr with PHP-FPM on Docker

WORK IN PROGRESS

This image provides Dolibarr with PHP-FPM, based on a lightweight Alpine image.
Its goals are:

* to provide an image as light as possible
* to be able to use it with NginX instead of Apache

The image initialization process is based on the official Dolibarr dockerfile,
with a little bit more security (specifically, files that do not need to be
modified are owned by root instead of www-data).

This image is way smaller than an image built with the official Dolibarr
(~280MB, vs ~580MB), but does not provide the webserver. To serve Dolibarr, you
can use the official nginx:alpine webserver, which is very small too (less than
20 MB).

## NginX configuration

This image provides an NginX configuration, which works with the nginx:alpine
image. Just use VolumesFrom, and NginX has access to its configuration and
its 

This configuration assumes the Dolibarr PHP-FPM container is reachable through
name "dolibarr" (which can be enforces with a link).

## Documents directory

The documents directory is `/documents`. If you want to keep data between
launches of the container, please mount an external volume on this directory.

If you don't use specific templates, it may not be mandatory: Dolibarr can
regenerate documents (but it is not an ideal setup)

## Dolibarr configuration

Dolibarr configuration must be provided with environment variables:

* `URL_ROOT`: URL on which Dolibarr is accessed
* `DB_HOST`: Database hostname
* `DB_PORT`: Dabase port
* `DB_NAME`: Database name
* `DB_USER`: Database username
* `DB_PASS`: Database password
* `DB_TYPE`: Database type ("mysqli" or "pgsql")
