#!/usr/bin/env bash

GITHUB_ACCESS_TOKEN=$1

if [ -z ${GITHUB_ACCESS_TOKEN} ]; then
    echo -n "Enter Github Access Token: "
    read gat
    GITHUB_ACCESS_TOKEN=${gat}
fi

echo ${GITHUB_ACCESS_TOKEN} | git clone https://github.com/martin-juul/DataKomAPI.git

cd DataKomApi

composer install --no-dev

echo "Done!"

exit 0