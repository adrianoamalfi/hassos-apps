ARG BUILD_FROM
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG STIRLING_PDF_VERSION="0.36.5"

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

# Copy root filesystem
COPY rootfs /

# Make scripts executable
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
