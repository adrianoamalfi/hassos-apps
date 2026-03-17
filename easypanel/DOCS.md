# Easypanel

## About

A modern server control panel to deploy and manage Docker applications, databases,
and services — directly from your Home Assistant instance.

Based on [easypanel-io/easypanel](https://github.com/easypanel-io/easypanel).

## Features

- Deploy apps from Docker images, GitHub repos, or templates
- Manage databases (PostgreSQL, MySQL, MongoDB, Redis)
- Built-in SSL/TLS via Let's Encrypt
- Reverse proxy and domain management
- Real-time logs and resource monitoring

## Installation

1. Add the repository to Home Assistant (see the main [README](../README.md))
2. Find **Easypanel** in the add-on store
3. Click **Install** and wait for the build to complete
4. Start the add-on and check the logs for errors

## Configuration

```yaml
log_level: info
timezone: "Europe/Rome"
```

| Option | Description | Default |
|--------|-------------|---------|
| `log_level` | Log verbosity (`trace`, `debug`, `info`, `warning`, `error`, `fatal`) | `info` |
| `timezone` | Timezone for the addon (e.g. `Europe/Rome`, `America/New_York`) | `Europe/Rome` |

## Access

Once started, access Easypanel through the Home Assistant sidebar (Ingress)
or directly via port 3000 if you enable it in the network configuration.

## Data

All Easypanel data (apps, configurations, databases) is stored persistently
in `/data/easypanel`. This is included in Home Assistant snapshots/backups.

## Notes

Easypanel manages Docker services and requires access to the Docker socket.
Make sure the add-on has the necessary permissions to interact with Docker
on your Home Assistant host.
