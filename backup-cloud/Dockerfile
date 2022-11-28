FROM alpine:3.16
RUN apk update
RUN apk add busybox curl bash unzip
RUN curl https://rclone.org/install.sh | bash
RUN touch /var/log/last-rclone-gdrive.log 
COPY .rclone.conf /root
COPY entrypoint.sh /root/entrypoint.sh
CMD ["/root/entrypoint.sh"]
