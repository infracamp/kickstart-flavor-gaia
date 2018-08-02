#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e


apt-get -y install apache2 libapache2-mod-php7.2 composer php-imagick php7.2-curl  php-redis php-xml php-xdebug \
                    php-zip php-mbstring php-ssh2 php-yaml php-xml php-json php-gd \
                    php7.2-intl \
                    php7.2-sqlite3 php-mongodb php7.2-mysql \
                    phpmd phpcpd iputils-ping telnet npm \
                    php-zmq php-http


# Sodium: Rising fatal errors:
# Removed: php-mcrypt => php-libsodium

rm -R /var/www/html
# => linking is done in flavor-prepare-start.sh

##cp /root/flavor/000-default.conf /etc/apache2/sites-available/

# Allow access to composer global install scripts
echo 'export PATH="$PATH:/home/user/.composer/vendor/bin:/opt/vendor/bin"' >> /home/user/.bashrc



