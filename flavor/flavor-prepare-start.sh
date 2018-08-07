#!/bin/bash

## This script is executed when the container starts up

echo "[flavor-start.sh] Setting timezone to $TIMEZONE..."
ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

if [ "$KICK_APACHE_WWW_ROOT" == "" ]
then
    KICK_APACHE_WWW_ROOT=/opt/www
fi
echo "Apache www-root: $KICK_APACHE_WWW_ROOT";
rm -R /var/www/html
ln -s $KICK_APACHE_WWW_ROOT /var/www/html

APACHE_CONF_DIR_OPTIONS=""

if [ "$KICK_APACHE_FALLBACK_RESOURCE" != "" ]
then
    APACHE_CONF_DIR_OPTIONS="$APACHE_CONF_DIR_OPTIONS\nFallbackResource $KICK_APACHE_FALLBACK_RESOURCE";
fi

# Write config file:
sed "s|%%DIR_PARAMS%%|$APACHE_CONF_DIR_OPTIONS|g" /kickstart/flavor/000-default.conf > /etc/apache2/sites-available/000-default.conf

echo "Setting HTTP_PORT to $KICK_HTTP_PORT"
echo "Listen $KICK_HTTP_PORT" > /etc/apache2/ports.conf

iniFile="/etc/php/7.2/mods-available/kickstart-flavor.ini"
echo "; Autogenerated file by kickstart-flavor-gaia : flavor-start.sh" > $iniFile
phpenmod kickstart-flavor


XdebugIniFile="/etc/php/7.2/mods-available/xdebug.ini"
if [[ "$DEV_MODE" = "0" ]]
then
    ### PRODUCTION SETTINGS ###
    echo "Setting production settings... ($iniFile)";
    echo "display_errors = no" >> $iniFile

    echo "Deactivating xdebug..."
    echo "" > $XdebugIniFile
else
    ### DEVELOPMENT SETTINGS ###
    echo "Setting development settings... ($iniFile)";
    echo "display_errors = yes" >> $iniFile
    echo "display_startup_errors = yes" >> $iniFile
    echo "zend.assertions = 1" >> $iniFile
    echo "assert.exception = 1" >> $iniFile

    echo "Activating xdebug..."
    cp /kickstart/flavor/xdebug.ini $XdebugIniFile
fi;


