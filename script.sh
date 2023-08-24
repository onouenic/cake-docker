#!/bin/bash

while [ ! -d /var/www/html/app/Vendor/composer/ ]; do
    sleep 1
done

chmod -R 755 /var/www/html/app/Vendor/composer

exec apache2-foreground