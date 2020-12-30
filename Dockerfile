FROM phusion/baseimage:bionic-1.0.0

MAINTAINER David Coppit <david@coppit.org>

RUN apt-add-repository ppa:mumble/release \
	&& apt-get update \
	&& apt-get install -y mumble-server=1.3.3-1~ppa1~bionic1

# Add the start script
ADD start.sh /tmp/start.sh

RUN chmod 755 /tmp/start.sh

VOLUME ["/data"]

EXPOSE 64738

CMD ["/tmp/start.sh"]
