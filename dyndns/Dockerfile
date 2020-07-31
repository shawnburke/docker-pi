FROM resin/rpi-raspbian:stretch

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g dynroute

ENV REFRESH=300

HEALTHCHECK CMD pgrep -f dynroute || exit 1

COPY entrypoint.sh /
CMD  ["/entrypoint.sh"]
