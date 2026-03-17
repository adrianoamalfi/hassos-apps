#!/usr/bin/with-contenv bashio
# shellcheck shell=bash
set -e

DATA_DIR="/data"

bashio::log.info "Starting Uptime Kuma..."

# Ensure data directory exists
mkdir -p "${DATA_DIR}"

cd /opt/uptime-kuma

# --- Core settings ---
export DATA_DIR="${DATA_DIR}"
export UPTIME_KUMA_PORT=3001
export UPTIME_KUMA_HOST=0.0.0.0

# --- Timezone ---
TIMEZONE=$(bashio::config 'timezone')
if bashio::var.has_value "${TIMEZONE}"; then
    export TZ="${TIMEZONE}"
    bashio::log.info "Timezone set to ${TIMEZONE}"
fi

# --- Trust proxy ---
if bashio::config.true 'trust_proxy'; then
    export UPTIME_KUMA_TRUST_PROXY=1
    bashio::log.info "Trust proxy enabled"
fi

# --- Disable X-Frame-Options (allow iframe embedding) ---
if bashio::config.true 'disable_frame_sameorigin'; then
    export UPTIME_KUMA_DISABLE_FRAME_SAMEORIGIN=true
    bashio::log.info "Frame sameorigin restriction disabled (iframe embedding allowed)"
fi

# --- TLS certificate validation ---
if ! bashio::config.true 'node_tls_reject_unauthorized'; then
    export NODE_TLS_REJECT_UNAUTHORIZED=0
    bashio::log.warning "TLS certificate validation disabled - use only in trusted environments!"
fi

bashio::log.info "Uptime Kuma listening on port ${UPTIME_KUMA_PORT}"

# Start Uptime Kuma
exec node server/server.js
