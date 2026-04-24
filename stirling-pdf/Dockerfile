ARG BUILD_FROM
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG STIRLING_PDF_VERSION="2.9.2"

# Install Java runtime and dependencies
# hadolint ignore=DL3018
RUN apk add --no-cache \
        openjdk17-jre-headless \
        curl \
        libreoffice \
        ttf-liberation \
        fontconfig \
    && mkdir -p /opt/stirling-pdf \
    && curl -fsSL \
        "https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v${STIRLING_PDF_VERSION}/Stirling-PDF-with-login.jar" \
        -o /opt/stirling-pdf/stirling-pdf.jar

# Copy root filesystem overlay
COPY rootfs /

# Make scripts executable
RUN chmod a+x /run.sh

# Data directory
VOLUME ["/data"]

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -fsS http://localhost:8080/ > /dev/null || exit 1

CMD [ "/run.sh" ]
