# Stirling PDF

## About

Self-hosted PDF manipulation tool. Merge, split, rotate, convert, compress,
and perform many more operations on PDF files directly from Home Assistant.

Based on [Stirling-Tools/Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF).

## Features

- Merge and split PDFs
- Convert to/from PDF (images, Word, PowerPoint)
- Compress, rotate, and rearrange pages
- Add watermarks, page numbers, and signatures
- OCR support for scanned documents
- No data leaves your server

## Installation

1. Add the repository to Home Assistant (see the main [README](../README.md))
2. Find **Stirling PDF** in the add-on store
3. Click **Install** and wait for the build to complete
4. Start the add-on and check the logs for errors

## Configuration

```yaml
log_level: info
```

| Option | Description | Default |
|--------|-------------|---------|
| `log_level` | Log verbosity (`trace`, `debug`, `info`, `warning`, `error`, `fatal`) | `info` |

## Access

Once started, access Stirling PDF through the Home Assistant sidebar (Ingress)
or directly via port 8080 if you enable it in the network configuration.

## Data

Application data and logs are stored persistently in `/data`. This is
included in Home Assistant snapshots/backups.

## Support

For issues, open a ticket at:
<https://github.com/adrianoamalfi/hassos-apps/issues>

## Known Issues

- LibreOffice-based conversions may be slow on low-powered devices (e.g., Raspberry Pi)
