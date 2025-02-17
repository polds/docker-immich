FROM ghcr.io/immich-app/immich-server:release

RUN useradd sys-immich
RUN groupadd unifi-drive

USER sys-immich

# From https://github.com/immich-app/immich/blob/main/server/Dockerfile
VOLUME /usr/src/app/upload
EXPOSE 2283
ENTRYPOINT ["tini", "--", "/bin/bash"]
CMD ["start.sh"]

HEALTHCHECK CMD immich-healthcheck
