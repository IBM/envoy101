#!/bin/bash

# Copyright IBM Corporation 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset

ENVOY_TAG_PREFIX=envoy101-

docker build --tag ${ENVOY_TAG_PREFIX}base:latest base

for dir in *; do
    if [ -d $dir -a "$dir" != "base" ]; then
        echo "Building image for ${dir}"
        if [ -f $dir/Dockerfile ]; then
            docker build --tag ${ENVOY_TAG_PREFIX}${dir}:latest $dir
        else
            docker build --tag ${ENVOY_TAG_PREFIX}${dir}:latest $dir -f - < base/Dockerfile.derived
        fi
    fi
done
