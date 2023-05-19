FROM dock.mau.dev/maubot/maubot:latest
LABEL org.opencontainers.image.source="https://github.com/beeper/maubot-runner"
RUN apk --no-cache add git gettext
COPY . /opt/beeper
CMD ["/bin/sh", "/opt/beeper/entrypoint.sh"]
