#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

bashio::log.info "Starting Stirling PDF..."

export DOCKER_ENABLE_SECURITY=false
export SERVER_PORT=8080
export SYSTEM_DEFAULTLOCALE=en_US
export PUID=0
export PGID=0

# Persistent config and data
export CONFIG_DIR="/config"
export LOGS_DIR="/config/logs"

mkdir -p "${CONFIG_DIR}" "${LOGS_DIR}"

bashio::log.info "Stirling PDF listening on port ${SERVER_PORT}"

# Start Stirling PDF
cd /opt/stirling-pdf
exec java -jar stirling-pdf.jar
