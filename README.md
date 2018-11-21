# Intro To Envoy

## Overview

This tutorial will demonstrate a few basic examples of utilizing Envoy outside of the Istio mesh. This is useful for developers that want to learn the internals of Envoy configuration. The presentation will review Envoy internals, configuration, and advanced terminology.

## Prerequisites

- Install latest version of Docker & Docker-Compose

### Build Demos

```bash
cd ./assets
./build_images.sh
```

## Demos

### sni-proxy-https

This example starts an Envoy instance to proxy requests to wikipedia & developer.ibm.com. The demo script will start Envoy & run a series of curl commands to show the Envoy access log values, stats for each site, and what the client will see.

```bash
cd ./assets/sni-proxy-https
docker-compose up 
```

### double-proxy-mtls

This example starts 2 instances of Envoy to proxy requests for ibm.developer.com between two Envoy processes. It highlights what a user will see when leveraging mtls session between Envoy processes and how upstream instances are selected.

```bash
cd ./assets/double-proxy-mtls/
docker-compose up 
```


