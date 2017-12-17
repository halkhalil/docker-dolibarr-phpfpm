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

