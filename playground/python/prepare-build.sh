#!/bin/bash
set -euo pipefail

if [ "$STATEFUN_SOURCE" == "public" ]; then 

  # if using public statefun source, install the sdk
  pip install "apache-flink-statefun==${STATEFUN_VERSION}"

elif [ "$STATEFUN_SOURCE" == "local" ]; then 

  # if using local statefun source, install the sdk locally
  cp -r project/statefun-sdk-python statefun-sdk-python
  pip install ./statefun-sdk-python

fi
