#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

DATA_DIR="/data"

bashio::log.info "Starting Uptime Kuma..."

# Ensure data directory exists
mkdir -p "${DATA_DIR}"

cd /opt/uptime-kuma

# Set the data directory and port
export DATA_DIR="${DATA_DIR}"
export UPTIME_KUMA_PORT=3001
export UPTIME_KUMA_HOST=0.0.0.0

bashio::log.info "Uptime Kuma listening on port ${UPTIME_KUMA_PORT}"

# Start Uptime Kuma
exec node server/server.js
