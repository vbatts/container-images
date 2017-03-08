FROM fedora:25
RUN dnf install -y pandoc-pdf texlive-euenc texlive-fontspec texlive-mathspec && dnf clean all
ENV HOME=/tmp
ENTRYPOINT ["/usr/bin/pandoc"]
