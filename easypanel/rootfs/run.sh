#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

DATA_DIR="/data/easypanel"

bashio::log.info "Starting Easypanel..."

# Ensure data directory exists
mkdir -p "${DATA_DIR}"

# --- Timezone ---
TIMEZONE=$(bashio::config 'timezone')
if bashio::var.has_value "${TIMEZONE}"; then
    export TZ="${TIMEZONE}"
    bashio::log.info "Timezone set to ${TIMEZONE}"
fi

# --- Environment ---
export EASYPANEL_DATA_DIR="${DATA_DIR}"
export PORT=3000
export HOST=0.0.0.0

bashio::log.info "Easypanel listening on port ${PORT}"
bashio::log.info "Data directory: ${DATA_DIR}"

# Start Easypanel
exec /opt/easypanel/server
