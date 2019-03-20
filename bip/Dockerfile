FROM fedora

RUN dnf update -y --refresh && \
    dnf install -y bip && \
    dnf clean all
RUN mkdir -p /bip && \
    sed -i 's/^#ip/ip/' /etc/bip.conf && \
    sed -i 's/^#port/port/' /etc/bip.conf && \
    sed -i 's|^log_root.*$|log_root = "/bip/logs";|' /etc/bip.conf && \
    sed -i 's|^pid_file.*$|pid_file="/bip/bip.pid";|' /etc/bip.conf

RUN mkdir -p /data && chown -R bip:bip /data
COPY run.sh /run.sh
USER bip
VOLUME ["/data"]
EXPOSE 7778
ENV HOME=/data
ENV BIPCONF=/etc/bip.conf

CMD ["/bin/sh", "/run.sh"]
