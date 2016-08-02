# docker-nodered-haproxy-websocket


Usage:

```
docker run -it --rm -p 1880:1880 -p 80:80 jing/docker-nodered-haproxy-websocket:latest

curl http://<docker-host-ip>
```

ELB Configuration (don't use HTTP protocal in the config):
 - 80 (TCP) forwarding to 80 (TCP)
 - 443 (SSL TCP) forwarding to 80 (TCP)
 - No need to add ProxyProtocal Policy in ELB

Default HAProxy Stats:
 - URI: /haproxy?stats
 - Username: Username
 - Password: Password

NodeRed:
 - `/data` volume can be mounted for additional configuration
 - environment variable `FLOW` points to the path to the flow.json (e.g. mount it as volume)
 - Since the image is based on NodeRed image, more NodeRed specific usage can be found here: https://hub.docker.com/r/nodered/node-red-docker/


