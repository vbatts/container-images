FROM fedora:rawhide
RUN dnf install -y pandoc-pdf && dnf clean all
ENV HOME=/tmp
ENTRYPOINT ["/usr/bin/pandoc"]
