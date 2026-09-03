# Claude in Docker
#
# Build:
#   docker build -t home .
#
FROM debian:trixie-slim

RUN apt-get update \
 && apt-get install -y --no-install-recommends ca-certificates curl rlwrap build-essential git jq vim lynx nodejs poppler-utils \
 && rm -rf /var/lib/apt/lists/*

RUN corepack enable

COPY debs/ /debs/
RUN ls debs/*.deb >/dev/null 2>&1 && dpkg -i /debs/*.deb || echo "No additional .deb package to install"

# Accept build arguments
ARG UID=1000
ARG GID=1000

# Create group and user
RUN groupadd -g $GID user && \
    useradd -m -u $UID -g $GID user

WORKDIR /agent
RUN chown -R user:user /agent
RUN chown -R user:user /home/user

WORKDIR /home/user

# Switch to non-root user
USER user

ENTRYPOINT ["/bin/bash"]
