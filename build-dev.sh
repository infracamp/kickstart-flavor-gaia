#!/bin/bash

git submodule update --init --recursive

docker build --pull -t infracamp/kickstart-flavor-gaia:testing .

