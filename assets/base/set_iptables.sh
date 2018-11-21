#!/bin/bash

#based on https://github.com/istio/pilot/blob/master/docker/prepare_proxy.sh

ENVOY_PORT=$1
ENVOY_UID=$2

iptables -t nat -N ISTIO_REDIRECT
iptables -t nat -A ISTIO_REDIRECT -p tcp -j REDIRECT --to-port $ENVOY_PORT
iptables -t nat -A PREROUTING -j ISTIO_REDIRECT

iptables -t nat -N ISTIO_OUTPUT
iptables -t nat -A OUTPUT -p tcp -j ISTIO_OUTPUT
iptables -t nat -A ISTIO_OUTPUT -m owner --uid-owner ${ENVOY_UID} -j RETURN
iptables -t nat -A ISTIO_OUTPUT -p tcp --dport 8001 -j RETURN
iptables -t nat -A ISTIO_OUTPUT -j ISTIO_REDIRECT
