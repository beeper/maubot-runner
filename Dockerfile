FROM dock.mau.dev/maubot/maubot:latest
RUN apk --no-cache add git gettext
COPY . /opt/beeper
CMD ["/bin/sh", "/opt/beeper/entrypoint.sh"]
