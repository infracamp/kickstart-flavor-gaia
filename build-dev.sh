#!/bin/bash

set -e
git submodule update --init --recursive --remote

docker build --pull -t infracamp/kickstart-flavor-gaia:testing .

docker run -it -e DEV_MODE=1 infracamp/kickstart-flavor-gaia:testing