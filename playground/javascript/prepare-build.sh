#!/bin/bash
set -euo pipefail

if [ "$STATEFUN_SOURCE" == "public" ]; then 

  # if using public statefun source, install the sdk 
  npm install "apache-flink-statefun@${STATEFUN_VERSION}"

elif [ "$STATEFUN_SOURCE" == "local" ]; then 

  # if using local statefun source, use npm link to register the local package
  cp -r project/statefun-sdk-js ./
  (
    cd statefun-sdk-js/
    npm link
  )
  npm install
  npm link "apache-flink-statefun@${STATEFUN_VERSION}"
fi
