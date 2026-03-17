ARG BUILD_FROM
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG UPTIME_KUMA_VERSION="2.2.1"

# Install Node.js, build dependencies, and clone Uptime Kuma
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

# Build with JIT disabled to avoid "Illegal instruction" under QEMU emulation
# on cross-architecture builds (aarch64 on amd64 runner).
# Also use --omit=dev instead of deprecated --production flag.
# hadolint ignore=DL3018
RUN NODE_OPTIONS="--max-old-space-size=3072 --jitless" \
        npm ci --omit=dev \
    && NODE_OPTIONS="--jitless" \
        npm run download-dist \
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

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:3001/ || exit 1

CMD [ "/run.sh" ]
