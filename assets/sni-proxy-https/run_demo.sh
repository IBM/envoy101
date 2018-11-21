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

ENVOY_PORT=15001

./set_iptables.sh $ENVOY_PORT `id -u root`
envoy -c envoy_config.yaml --v2-config-only &

su - clientuser -c "curl -s https://www.wikipedia.org | grep -o '<title>.*</title>'"
su - clientuser -c "curl -s https://de.wikipedia.org/wiki/Wikipedia:Hauptseite | grep -o '<title>.*</title>'"
sleep 5
curl -s localhost:8001/stats | grep cluster.wikipedia.upstream_cx_total
curl -s localhost:8001/stats
su - clientuser -c "curl -s https://developer.ibm.com | grep -o '<title>.*</title>'"
sleep 5
curl -s localhost:8001/stats | grep cluster.ibm.upstream_cx_total
