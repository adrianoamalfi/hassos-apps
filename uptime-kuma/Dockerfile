ARG BUILD_FROM
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG UPTIME_KUMA_VERSION="1.23.15"

# Install Node.js, build dependencies, and Uptime Kuma
# hadolint ignore=DL3018
RUN apk add --no-cache \
        nodejs \
        npm \
        git \
        python3 \
        make \
        g++ \
        sqlite \
    && git clone --depth 1 --branch "${UPTIME_KUMA_VERSION}" \
        https://github.com/louislam/uptime-kuma.git /opt/uptime-kuma

WORKDIR /opt/uptime-kuma

# hadolint ignore=DL3018
RUN npm ci --production \
    && npm run download-dist \
    && apk del --no-cache \
        git \
        make \
        g++

# Copy root filesystem overlay
COPY rootfs /

# Data directory
VOLUME ["/data"]

# Make scripts executable
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
