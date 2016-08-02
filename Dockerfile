FROM nodered/node-red-docker:0.14.6-slim

USER root

# Install HAProxy, Python/pip
RUN apk add --update haproxy python py-pip
RUN rm -rf /var/cache/apk/*

RUN pip install supervisor

ADD supervisord.conf /etc/supervisord.conf
ADD haproxy.cfg /etc/haproxy.cfg

# User configuration directory volume
VOLUME ["/data"]
EXPOSE 1880 80

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]
