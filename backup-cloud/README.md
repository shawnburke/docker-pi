# backup-cloud

Containerized rclone to backup google cloud and other services to a local drive.

See docs at https://rclone.org/overview/.

## Configuring

The easiest way to configure is:

1. Start the container
2. Connect to it `docker run -it backup-cloud bash`
3. Run `rclone config`
4. Pick up the config file `docker cp backup-cloud:/root/.rclone.conf .`
5. Restart

