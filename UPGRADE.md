# Upgrade procedure

This document explains how to upgrade the Dolibarr version in this image.

## Download the new version

First, download the latest version of Dolibarr from the following address:
https://sourceforge.net/projects/dolibarr/files/

Then unzip the archive and create a tar.gz from the htdocs directory:

```
unzip dolibarr*.zip
cd dolibarr-*/htdocs/
tar zcf ../../htdocs.tar.gz *
cd ../..
rm -r dolibarr-*
```

## Extract the new database

If the new version ships with a new database, you may need to reinitialize the
database initial data:

* First, instantiate a temporary container, using a new database.
* Then, make the configuration file writeable (`chmod 666
/var/www/html/conf/conf.php`)
* Then, initialize the database
* Then, stop the container
* Then, extract the database content with mysqldump
* Finally, replace the mysql.dump file with the new extract

To extract the database content:

```
mysqldump -h <DB_HOST> -u <DB_USER> --password=<DB_PASS> <DB_NAME> > mysql.dump
```

Maybe you will want to remove the hostname and the database name from the dump
header...

The maintainer of this package is french, thus this archive is created on a
system with french as the default language...
