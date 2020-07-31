# OPENVPN


## Env Vars

* `OPENVPN_PORT`: Port to use for OpenVPN, defaults to `1194`

## Helper scripts
### Init new server
```
./init.sh foo.example.com
```

Initializes a new server reachable at `foo.example.com`.

For dynamic DNS, see the [dyndns container](../dyndns/README.md) or use something like [DuckDNS](https://duckdns.org) with a router that supports it.

### Create client

```
./create_client.sh [client-name] [nopass]
```
Example: `./create_client.sh my-client-name nopass` will create a client `./ovpns/my-client-name.ovpn` that does not have a password.

### Remove client
```
./remove_client.sh [client-name]
```
