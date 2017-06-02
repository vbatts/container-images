FROM fedora:25
RUN dnf install -y npm && dnf update -y && dnf clean all
RUN npm install -g slack-irc
RUN echo "[]" > /config.json
CMD ["--config","/config.json"]
ENTRYPOINT ["/usr/bin/slack-irc"]
