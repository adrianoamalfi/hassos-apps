# Stirling PDF

Self-hosted PDF manipulation tool. Merge, split, rotate, convert, compress,
and perform many more operations on PDF files directly from Home Assistant.

## Features

- Merge and split PDFs
- Convert to/from PDF (images, Word, PowerPoint)
- Compress, rotate, and rearrange pages
- Add watermarks, page numbers, and signatures
- OCR support for scanned documents
- No data leaves your server

## Configuration

| Option | Description | Default |
|---|---|---|
| `log_level` | Log verbosity | `info` |

## Access

Once started, access Stirling PDF through the Home Assistant sidebar (Ingress)
or directly via port 8080 if you enable it in the network configuration.
