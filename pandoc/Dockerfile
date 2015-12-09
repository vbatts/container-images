FROM fedora:23
RUN dnf install -y pandoc texlive && dnf clean all
ENTRYPOINT ["/usr/bin/pandoc"]
