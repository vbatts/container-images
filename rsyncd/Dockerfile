FROM alpine
RUN apk add rsync && mkdir -p /data && touch /etc/rsyncd.conf
VOLUME ["/data"]
EXPOSE 873
CMD ["/usr/bin/rsync","--daemon","--no-detach","--config", "/etc/rsyncd.conf"]
