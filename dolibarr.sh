#!/bin/sh

# First, initialize the documents directory if necessary
mkdir -p /documents/bank /documents/doctemplates/contracts \
         /documents/doctemplates/invoices /documents/doctemplates/orders \
         /documents/doctemplates/products /documents/doctemplates/projects \
         /documents/doctemplates/proposals /documents/doctemplates/tasks \
         /documents/doctemplates/thirdparties /documents/doctemplates/users \
         /documents/doctemplates/usergroups /documents/facture \
         /documents/ficheinter /documents/mycompany /documents/produit \
         /documents/propale /documents/users/temp

echo "contracts contract
invoices invoice
orders order
products product
projects project
proposals proposal
tasks task_sommary
thirdparties thirdparty
usergroups usergroups
users user" | while read line
do
    d="$(echo $line | cut -d" " -f1)"
    f="$(echo $line | cut -d" " -f2)"
    test -e /documents/doctemplates/$d/template_$f.odt || \
    cp /var/www/html/install/doctemplates/$d/template_$f.odt /documents/doctemplates/$d/
done
chown -R www-data.www-data /documents

docker-php-entrypoint php-fpm
