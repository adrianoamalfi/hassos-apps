ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG UPTIME_KUMA_VERSION="1.23.15"

# Install build dependencies and Uptime Kuma
# hadolint ignore=DL3018
RUN apk add --no-cache \
        git \
        python3 \
        make \
        g++ \
        sqlite \
    && git clone --depth 1 --branch "${UPTIME_KUMA_VERSION}" \
        https://github.com/louislam/uptime-kuma.git /opt/uptime-kuma \
    && cd /opt/uptime-kuma \
    && npm ci --production \
    && npm run download-dist \
    && apk del --no-cache \
        git \
        make \
        g++

# Copy root filesystem
COPY rootfs /

# Data directory
VOLUME ["/data"]

# Make scripts executable
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
