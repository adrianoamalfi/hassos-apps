# Use the official Easypanel image as the application base
FROM easypanel/easypanel:latest AS easypanel-source

ARG BUILD_FROM
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Install runtime dependencies
# hadolint ignore=DL3018
RUN apk add --no-cache \
        curl \
        bash \
        tzdata \
        ca-certificates \
        openssl \
        docker-cli

# Copy Easypanel server from the official image
COPY --from=easypanel-source /app /opt/easypanel
COPY --from=easypanel-source /usr/local/bin /usr/local/bin

# Copy root filesystem overlay
COPY rootfs /

# Make scripts executable
RUN chmod a+x /run.sh

# Expose Easypanel port
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -fs http://localhost:3000/api/health || exit 1

CMD [ "/run.sh" ]
