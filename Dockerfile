FROM debian:bookworm-slim

ENV SRS_HOME=/data

COPY ./bin/SRS-Server-Commandline-Linux /app/SRS-Server-Commandline-Linux
COPY ./docker-entrypoint.sh /app/docker-entrypoint.sh

RUN apt-get update \
    && apt-get install --no-install-recommends --yes libicu72 libssl3 \
    && rm -rf /var/lib/apt/lists/* \
    && chmod 0755 /app/SRS-Server-Commandline-Linux \
    && chmod 0755 /app/docker-entrypoint.sh \
    && mkdir -p "$SRS_HOME"

WORKDIR $SRS_HOME
VOLUME ["/data"]

EXPOSE 5002/udp
EXPOSE 5002/tcp
EXPOSE 8080

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD []