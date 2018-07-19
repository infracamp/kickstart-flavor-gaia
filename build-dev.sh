#!/bin/bash

git submodule update --init --recursive --remote

docker build --pull -t infracamp/kickstart-flavor-gaia:testing .

