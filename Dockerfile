FROM ubuntu:18.04
LABEL maintainer="Matthias Leuffen <m@tth.es>"

ADD / /
RUN chmod -R 755 /kickstart
RUN /kickstart/template/base-install-ubuntu.sh
RUN /kickstart/scripts/build.sh


ENV TIMEZONE Europe/Berlin
ENV KICKSTART_HYPERVISE_HOST="http://kickstart-hypervise/"

ENV HTTP_PORT "4200"
ENV DEV_MODE "0"
ENV DEV_CONTAINER_NAME "unnamed"
ENV DEV_UID "1000"
ENV DEV_TTYID "xXx"

ENV CONF_DUMMY_VALUE "TEST CONFIG VALUE"

# Use for debugging:
#ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["/kickstart/scripts/start.sh"]
