#
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

FROM node:16
ARG BUILD_DIR
ARG STATEFUN_VERSION
ARG STATEFUN_SOURCE
ENV STATEFUN_VERSION=${STATEFUN_VERSION}
WORKDIR /usr/src/app

COPY "${BUILD_DIR}/package.json" package.json
RUN --mount=type=bind,source=./,target=project STATEFUN_SOURCE=${STATEFUN_SOURCE} project/playground/javascript/prepare-build.sh

# RUN npm install "apache-flink-statefun@${STATEFUN_VERSION}"

COPY "${BUILD_DIR}/functions.js" ./

EXPOSE 8000
CMD ["npm", "start"]
