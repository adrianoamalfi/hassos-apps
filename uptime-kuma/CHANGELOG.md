# Changelog

## [1.1.2] - 2026-05-03

### Changed

- Updated Uptime Kuma to 2.3.0

## [1.1.1] - 2026-03-17

### Changed

- Updated Uptime Kuma to 2.2.1

## [1.1.0] - 2026-03-17

### Added

- `timezone` option: set the timezone for Uptime Kuma (e.g. `Europe/Rome`)
- `trust_proxy` option: enable trust of reverse proxy headers for correct client IP detection
- `disable_frame_sameorigin` option: allow Uptime Kuma to be embedded in iframes
- `node_tls_reject_unauthorized` option: control TLS certificate validation (disable only in trusted networks)

## [1.0.0] - 2026-03-16

### Added

- Initial release
- Based on Uptime Kuma 1.23.15
- Ingress support for Home Assistant sidebar integration
- Persistent data storage
- Support for amd64 and aarch64 architectures
