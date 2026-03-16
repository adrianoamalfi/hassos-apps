# Adriano's Home Assistant Add-ons

[![Lint](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/lint.yaml/badge.svg)](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/lint.yaml)
[![Build](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/build.yaml/badge.svg)](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/build.yaml)

Custom add-ons repository for Home Assistant. Run popular self-hosted apps
directly from your Home Assistant instance.

## Installation

1. Open Home Assistant
2. Go to **Settings** > **Add-ons** > **Add-on Store**
3. Click the menu icon (top right) > **Repositories**
4. Add this URL:

```
https://github.com/adrianoamalfi/hassos-apps
```

5. Click **Add** and refresh the page

## Add-ons

| Add-on | Description | Upstream |
|---|---|---|
| [Uptime Kuma](./uptime-kuma) | Uptime monitoring for websites and services | [louislam/uptime-kuma](https://github.com/louislam/uptime-kuma) |
| [Stirling PDF](./stirling-pdf) | PDF manipulation tool (merge, split, convert, etc.) | [Stirling-Tools/Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF) |

## How it works

### Automation

This repository uses fully automated CI/CD:

- **PR Labeler** - PRs are automatically labeled by which add-on they modify
- **Lint** - Only changed add-ons are linted (addon-linter, yamllint, ShellCheck, Hadolint)
- **Build** - Only changed add-ons are test-built on all architectures
- **Release** - When a version bump is detected in `config.yaml` on `main`, a GitHub Release is created automatically
- **Publish** - On release, Docker images are built and pushed to GHCR
- **Dependabot** - GitHub Actions are kept up to date automatically
- **Stale** - Inactive issues and PRs are cleaned up after 30 days

### Release flow

```
PR with version bump in config.yaml
  -> merge to main
    -> release.yaml detects version change
      -> creates GitHub Release (e.g. uptime-kuma-v1.1.0)
        -> publish.yaml builds & pushes Docker images to GHCR
```

## Development

### Adding a new add-on

1. Create a new folder: `mkdir my-app`
2. Add the required files:

```
my-app/
├── config.yaml       # Add-on metadata (name, version, arch, options)
├── build.yaml        # Base images per architecture
├── Dockerfile        # Container build instructions
├── DOCS.md           # User documentation
├── CHANGELOG.md      # Version history
├── translations/
│   └── en.yaml       # English translations for options
└── rootfs/
    └── run.sh        # Entrypoint script
```

3. Open a pull request - CI will lint and test-build automatically
4. Merge - bump the `version` in `config.yaml` to trigger a release

### Local testing

```bash
# Build
docker build \
  --build-arg BUILD_FROM="ghcr.io/home-assistant/amd64-base:3.21" \
  -t local/my-app ./my-app

# Run
docker run --rm -p 8080:8080 local/my-app
```

## License

MIT License - see [LICENSE](LICENSE) for details.
