# Uptime Kuma

## About

Self-hosted uptime monitoring tool. Track the availability of your websites,
APIs, and services directly from Home Assistant.

Based on [louislam/uptime-kuma](https://github.com/louislam/uptime-kuma).

## Features

- Monitor HTTP(S), TCP, Ping, DNS, and more
- Notifications via Telegram, Discord, Slack, email, and 90+ services
- Status pages for public or internal use
- Multi-language dashboard

## Installation

1. Add the repository to Home Assistant (see the main [README](../README.md))
2. Find **Uptime Kuma** in the add-on store
3. Click **Install** and wait for the build to complete
4. Start the add-on and check the logs for errors

## Configuration

```yaml
log_level: info
timezone: "Europe/Rome"
trust_proxy: false
disable_frame_sameorigin: false
node_tls_reject_unauthorized: true
```

| Option | Description | Default |
|--------|-------------|---------|
| `log_level` | Log verbosity (`trace`, `debug`, `info`, `warning`, `error`, `fatal`) | `info` |
| `timezone` | Timezone for the addon (e.g. `Europe/Rome`, `America/New_York`) | `Europe/Rome` |
| `trust_proxy` | Trust reverse proxy headers (correct client IP behind proxies) | `false` |
| `disable_frame_sameorigin` | Allow embedding in iframes from other origins | `false` |
| `node_tls_reject_unauthorized` | Validate TLS certificates for monitored targets. Set `false` only for self-signed certs in trusted networks | `true` |

## Access

Once started, access Uptime Kuma through the Home Assistant sidebar (Ingress)
or directly via port 3001 if you enable it in the network configuration.

## Data

All monitoring data is stored persistently in `/data`. This is included in
Home Assistant snapshots/backups.

## Support

For issues, open a ticket at:
<https://github.com/adrianoamalfi/hassos-apps/issues>

## Known Issues

- Initial npm build during installation may take several minutes on ARM devices
