ARG BUILD_FROM
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Install only what's needed - python3 for the simple HTTP server
# hadolint ignore=DL3018
RUN apk add --no-cache \
        python3 \
        curl \
    && mkdir -p /opt/dolly/www

# Copy root filesystem overlay
COPY rootfs /

# Make scripts executable
RUN chmod a+x /run.sh

# Data directory for persistent storage
VOLUME ["/data"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=10s --retries=3 \
    CMD curl -fsS http://localhost:8080/ > /dev/null || exit 1

CMD [ "/run.sh" ]
