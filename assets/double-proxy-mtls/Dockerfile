FROM envoy101-base:latest

COPY envoy_config1.yaml $HOME
COPY envoy_config2.yaml $HOME
COPY run_demo.sh $HOME

RUN mkdir -p /etc/my-certs
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/my-certs/envoy1.key \
    -out /etc/my-certs/envoy1.crt -subj "/CN=envoy1.local"

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/my-certs/envoy2.key \
    -out /etc/my-certs/envoy2.crt -subj "/CN=envoy2.local"
