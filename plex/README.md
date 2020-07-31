# PLEX Media Server

Runs the Plex media server (which is great, btw) on your Raspberry Pi.

## Env Variables

* `PLEX_PORT`: Port to run plex on.  Defaults to `32400`
* `CONFIG_VOLUME`: Host path to load plex config and DB from. Defaults to `./config`.
* `MEDIA_VOLUME`: Host path to read media files from.  Defaults to `./data`.

Use `direnv` or something similar to set the volume paths for this instance.

