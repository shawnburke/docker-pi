# PLEX Media Server

Runs the Plex media server (which is great, btw) on your Raspberry Pi.

## Env Variables

* `PLEX_PORT`: Port to run plex on.  Defaults to `32400`
* `CONFIG_VOLUME`: Host path to load plex config and DB from. Defaults to `./config`.
* `MEDIA_VOLUME`: Host path to read media files from.  Defaults to `./data`.

Use `direnv` or something similar to set the volume paths for this instance.

## Troubleshooting

If you see this error: 

```
PMS: failure detected. Read/write access is required for path: /config/Library/
```


Start into a prompt:
```
docker run -it -v "$CONFIG_VOLUME:/config" --entrypoint bash  greensheep/plex-server-docker-rpi:latest
```

Then in the prompt:

```
root@8a7a3ef67149:/# chown -R nobody:users /config
root@8a7a3ef67149:/# chmod -R 777 /config
```
