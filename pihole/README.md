# PIHOLE

Run a local ad-blocker and DNS service

### Setup VARS:

* `EXTERNAL_IP`: the external address to bind to. Default is `0.0.0.0`, recommend using `.envrc` to set to `$(hostname -I | awk '{print $1}')`
* `HTTP_PORT`: Port for HTTP pihole web interface.
* `HTTPS_PORT`: Port for HTTPS pihole web interface.
* `TIMEZONE: Timezone for logs and events.  Recommend using `.envrc` to set to `$(cat /etc/timezone)`
* `FALLBACK_DNS`: DNS server to fall back to. Defaults to 1.1.1.1
* `WEB_UI_PASSWORD`: Password for pihole admin access.

### Custom DNS

Pihole runs `dnsmasq` so it's easy to use it for DNS on your local network.  To do this, simply add a file next to the `docker-comose.yml` file called `custom.list`, which is just like `/etc/hosts` format. Then restart the container.

Example `custom.list` file:

```
192.168.1.20    local-host-1
192.168.1.30    local-host-2
```