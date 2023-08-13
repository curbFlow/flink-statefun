# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Build the functions code ...
FROM maven:3.6.3-jdk-11 AS builder
ARG BUILD_DIR
ARG FLINK_VERSION
ARG STATEFUN_VERSION
ARG STATEFUN_SOURCE
ENV FLINK_VERSION=${FLINK_VERSION}
ENV STATEFUN_VERSION=${STATEFUN_VERSION}
WORKDIR /usr/src/app
COPY "${BUILD_DIR}/src" src
COPY "${BUILD_DIR}/pom.xml" pom.xml
RUN --mount=type=bind,source=./,target=project STATEFUN_SOURCE=${STATEFUN_SOURCE} project/playground/java/prepare-build.sh
RUN mvn clean package

# ... and run the web server!
FROM openjdk:11
ARG BUILD_DIR
WORKDIR /
COPY --from=builder /usr/src/app/target/statefun-playground-entrypoint*.jar statefun-playground-entrypoint.jar
COPY "${BUILD_DIR}/docker-entrypoint.sh" /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
