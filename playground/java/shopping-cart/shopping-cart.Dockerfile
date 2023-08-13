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
ARG STATEFUN_VERSION
ARG STATEFUN_SOURCE
ENV STATEFUN_VERSION=${STATEFUN_VERSION}
WORKDIR /usr/src/app
COPY "${BUILD_DIR}/src" src
COPY "${BUILD_DIR}/pom.xml" pom.xml
RUN --mount=type=bind,source=./,target=project STATEFUN_SOURCE=${STATEFUN_SOURCE} project/playground/java/prepare-build.sh
RUN mvn dependency:go-offline package -B 
RUN mvn clean package

# COPY pom.xml pom.xml
# # Build dependencies and cache this layer
# RUN mvn dependency:go-offline package -B
# COPY src src
# RUN mvn clean package

# ... and run the web server!
FROM openjdk:8
WORKDIR /
COPY --from=builder /usr/src/app/target/shopping-cart*jar-with-dependencies.jar shopping-cart.jar
EXPOSE 1108
CMD java -jar shopping-cart.jar
