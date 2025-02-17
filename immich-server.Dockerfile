FROM ghcr.io/immich-app/immich-server:release

RUN useradd unifi-drive-nfs
RUN groupadd unifi-drive

USER unifi-drive-nfs

# From https://github.com/immich-app/immich/blob/main/server/Dockerfile
VOLUME /usr/src/app/upload
EXPOSE 2283
ENTRYPOINT ["tini", "--", "/bin/bash"]
CMD ["start.sh"]

HEALTHCHECK CMD immich-healthcheck
