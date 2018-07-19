#!/bin/bash

#
# Kickstart Install file for Debian/Ubuntu Containers
#
# See: https://github.com/c7lab/kickstart/opt/installers
#

set -e
set -o pipefail
trap 'on_error $LINENO' ERR;
PROGNAME=$(basename $0)

function on_error () {
    echo "Error: ${PROGNAME} on line $1" 1>&2
    exit 1
}

export DEBIAN_FRONTEND=noninteractive

apt-get update

#touch /tmp/preseed.txt
#echo "tzdata  tzdata/Areas            select  Europe" > /tmp/preseed.txt
#echo "tzdata  tzdata/Zones/Europe     select  Berlin" >> /tmp/preseed.txt
##echo "tzdata  tzdata/Zones/Etc        select  UTC" >> /tmp/preseed.txt
#debconf-set-selections /tmp/preseed.txt

## In case of fire: comment out to investigate using Tools
## - debconf-utils : debconf-get-selections
#exit 0;

# Bug in Ubuntu18.04. You have to install tzdata standalone first!

apt-get install -y --no-install-recommends tzdata

apt-get install -y php7.2-cli curl zip composer vim nano git curl sudo


if [[ ! -e /kickstart ]]
then
    echo "Not local development mode: Cloneing https://github.com/c7lab/kickstart.git into /kickstart"
    echo "Cloning kickstart scripts..."
    mkdir /kickstart
    git clone --single-branch --depth 1 "https://github.com/c7lab/kickstart.git" /kickstart
fi;

echo "Running kickstart install scripts (container/build.sh)..."
. /kickstart/container/build.sh

echo "Done."
