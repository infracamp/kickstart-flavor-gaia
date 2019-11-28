#!/bin/bash

#
# This file is called from Kickstart to
# finalize the container installation
#

set -e
sudo apt-get -y install software-properties-common

sudo add-apt-repository ppa:ondrej/php
apt-get update
apt-get -y install gettext apache2 libapache2-mod-php7.4 composer php-imagick php7.2-curl  php-redis php-xml php-xdebug \
                    php-zip php-mbstring php-ssh2 php-yaml php-xml php-json php-gd \
                    php7.4-intl \
                    php7.4-sqlite3 php-mongodb php7.4-mysql \
                    phpmd phpcpd iputils-ping telnet npm \
                    php-zmq php-http php-soap php-apcu



# Sodium: Rising fatal errors:
# Removed: php-mcrypt => php-libsodium


##cp /root/flavor/000-default.conf /etc/apache2/sites-available/

# Allow access to composer global install scripts
echo 'export PATH="$PATH:/opt/vendor/bin"' >> /home/user/.bashrc

touch /home/user/.bashrc.kickstart
chmod 755 /home/user/.bashrc.kickstart

echo ". /home/user/.bashrc.kickstart" >> /home/user/.bashrc
