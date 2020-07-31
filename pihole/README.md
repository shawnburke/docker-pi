# PIHOLE

Run a local ad-blocker and DNS service

### Setup VARS:

* `EXTERNAL_IP`: the external address to bind to. Default is `0.0.0.0`, recommend using `.envrc` to set to `$(hostname -I | awk '{print $1}')`
* `HTTP_PORT`: Port for HTTP pihole web interface.
* `HTTPS_PORT`: Port for HTTPS pihole web interface.
* `TIMEZONE: Timezone for logs and events.  Recommend using `.envrc` to set to `$(cat /etc/timezone)`
* `FALLBACK_DNS`: DNS server to fall back to. Defaults to 1.1.1.1
* `WEB_UI_PASSWORD`: Password for pihole admin access.