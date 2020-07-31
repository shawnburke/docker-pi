# DOCKER-PI

I like to run a lot of services for my home on a Rasberry Pi.  To keep these services contained and easy to port to a new Pi, I have Dockerized all of them.  Upon getting a new Pi, I can have it up and running within a few minutes.

_This is a side hackery project of mine, so not everything is perfectly well factored, etc_.

### Rasberry Pi Setup

_Note that I run [Ubuntu](https://ubuntu.com/tutorials/how-to-install-ubuntu-on-your-raspberry-pi#1-overview) on my Pi.  This is nice because I run Ubuntu on other machines so everything is the same. I had most of this setup running on Raspbian in the past so that should work fine as well._

Getting up and running requires the following:

* Set up SSH. Strongly recommend only allowing `PubKeyAuthentication` and make sure you never allow your new Pi to be put onto a network that exposes it's port 22. Don't ask.

* Set up Docker and Docker Compose.  Follow [this guide](https://devdojo.com/bobbyiliev/how-to-install-docker-and-docker-compose-on-raspberry-pi) to get it up and running.

* Set up `git`: `sudo apt-get install git`

Now you should be all set.

Clone this repo, navigate to a service directory, set your environment (for example, using [direnv](https://direnv.net)), and run `docker-compose up -d`, and you should be set.

## Services

Each of the services below are set up in a similar manner:

* There is a `docker-compose.yml` file that defines the service.  All services container name is the same as the service so it's easy to do something like `docker logs openvpn`.  If, for some reason, you want to run multiple verisons, you'll need to change that.  These files use ENV variable injection for configuration parameters.  You shouldn't have to modify the docker-compose files yourself.

* Each service has an `.env` file that contains the default non-secret values for each container. Docker will automatically load this into the env when running Docker commands.

* For secrets, I recommend using `direnv`.  With this you can drop an `.envrc` file in each folder. These are excluded by `.gitignore` so you can use them for your secrets. You can use other solutions here but `direnv` is simple and easy to manage.

### Currently Supported Services

* [dyndns](dyndns/README.md): hand-rolled dynamic DNS updater that uses Route53.

* [pihole](pihole/README.md): turn your Pi into an ad-blocker for your whole network.

* [openvpn](openvpn/README.md): run an OpenVPN server.  This is a great way to have remote and secure access to your home network.

* [backup-cloud](backup-cloud/README.md): uses `rclone` to sync cloud storage (e.g. Google Drive, Google Photos) to an attached local drive. 

* [plex](plex/README.md): run a Plex media server.

