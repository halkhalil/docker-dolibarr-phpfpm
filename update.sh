#!/bin/sh
#
# Update the Dolibarr version in this docker image

echo "Please download the latest version of Dolibarr from:"
echo "https://sourceforge.net/projects/dolibarr/files/"
echo "Press any key to continue, once the latest version is in the current directory"
read foobar

unzip dolibarr*.zip
cd dolibarr-*/htdocs/
tar zcf ../../htdocs.tar.gz *
cd ../..
rm -r dolibarr-*

echo "That's all folks! You can build!"
