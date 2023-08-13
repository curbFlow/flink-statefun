#!/bin/bash
set -euo pipefail

# if using local statefun source, register the various pom and jar files, which are expected
# to be available under the 'project' folder (having been mounted there in the Dockerfile RUN command)
if [ "$STATEFUN_SOURCE" == "local" ]; then 

  install_pom () {
      mvn install:install-file \
        -Dpackaging=pom \
        -Dfile="$1/pom.xml" \
        -DpomFile="$1/pom.xml"
  }

  install_jar () {
      mvn install:install-file \
        -Dfile="$1/target/$2-$STATEFUN_VERSION.jar" \
        -DpomFile="$1/pom.xml"
  }

  install_pom project
  install_pom project/statefun-flink
  install_pom project/statefun-shaded

  install_jar project/statefun-flink/statefun-flink-core statefun-flink-core
  install_jar project/statefun-flink/statefun-flink-common statefun-flink-common
  install_jar project/statefun-flink/statefun-flink-extensions statefun-flink-extensions
  install_jar project/statefun-flink/statefun-flink-io statefun-flink-io
  install_jar project/statefun-flink/statefun-flink-io-bundle statefun-flink-io-bundle
  install_jar project/statefun-kafka-io statefun-kafka-io
  install_jar project/statefun-kinesis-io statefun-kinesis-io
  install_jar project/statefun-sdk-embedded statefun-sdk-embedded
  install_jar project/statefun-sdk-protos statefun-sdk-protos
  install_jar project/statefun-sdk-java statefun-sdk-java
  install_jar project/statefun-shaded/statefun-protobuf-shaded statefun-protobuf-shaded
  install_jar project/statefun-shaded/statefun-protocol-shaded statefun-protocol-shaded
fi
