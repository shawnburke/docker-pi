FROM resin/rpi-raspbian:stretch
RUN apt-get update
RUN apt-get install busybox cron
RUN curl https://rclone.org/install.sh | sudo bash
RUN touch /var/log/last-rclone-gdrive.log 
COPY .rclone.conf /root
COPY entrypoint.sh /root/entrypoint.sh
CMD ["/root/entrypoint.sh"]
