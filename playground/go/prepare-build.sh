#!/bin/bash
set -euox pipefail

if [ "$STATEFUN_SOURCE" == "public" ]; then 

  echo -e "\nrequire github.com/apache/flink-statefun/statefun-sdk-go/v3 v${STATEFUN_VERSION}\n" >> go.mod

elif [ "$STATEFUN_SOURCE" == "local" ]; then 

  cp -r project/statefun-sdk-go statefun-sdk-go
  echo -e "\nreplace github.com/apache/flink-statefun/statefun-sdk-go/v3 => ./statefun-sdk-go/v3\n" >> go.mod
  echo -e "\nrequire github.com/apache/flink-statefun/statefun-sdk-go/v3 v3\n" >> go.mod

fi

cat go.mod

