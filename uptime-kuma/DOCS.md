# Uptime Kuma

Self-hosted uptime monitoring tool. Track the availability of your websites,
APIs, and services directly from Home Assistant.

## Features

- Monitor HTTP(S), TCP, Ping, DNS, and more
- Notifications via Telegram, Discord, Slack, email, and 90+ services
- Status pages for public or internal use
- Multi-language dashboard

## Configuration

| Option | Description | Default |
|---|---|---|
| `log_level` | Log verbosity | `info` |

## Access

Once started, access Uptime Kuma through the Home Assistant sidebar (Ingress)
or directly via port 3001 if you enable it in the network configuration.

## Data

All monitoring data is stored persistently in `/data`. Backups are included
in Home Assistant snapshots.
