FROM envoyproxy/envoy:latest
ENV HOME /root

RUN apt-get update && apt-get install -y ca-certificates openssl iptables curl nmap telnet

RUN useradd -ms /bin/bash clientuser

WORKDIR $HOME
COPY set_iptables.sh $HOME
COPY run_envoy.sh $HOME

# expose envoy's stasd port
EXPOSE 8001
