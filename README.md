# Adriano's Home Assistant Add-ons

[![Lint](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/lint.yaml/badge.svg)](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/lint.yaml)
[![Build](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/build.yaml/badge.svg)](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/build.yaml)
[![Release](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/release.yaml/badge.svg)](https://github.com/adrianoamalfi/hassos-apps/actions/workflows/release.yaml)

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


| Add-on | Version | Description | Upstream |
|--------|---------|-------------|----------|
| [Dolly](./dolly) | 1.0.0 | A template add-on that serves as a reference for building new Home Assistant add-ons. Clone this to start your own! | - |
| [Stirling PDF](./stirling-pdf) | 1.0.0 | A self-hosted PDF manipulation tool with merge, split, convert, and more. | [Stirling-Tools/Stirling-PDF](https://github.com/Stirling-Tools/Stirling-PDF) |
| [Uptime Kuma](./uptime-kuma) | 1.1.0 | A self-hosted monitoring tool for tracking uptime of websites and services. | [louislam/uptime-kuma](https://github.com/louislam/uptime-kuma) |


> The table above is automatically updated by the
> [Update README](.github/workflows/update-readme.yaml) workflow.

## How it works

### Automation

This repository uses fully automated CI/CD:

| Workflow | Trigger | Purpose |
|----------|---------|---------|
| **[Lint](.github/workflows/lint.yaml)** | Push / PR | Addon linter, yamllint, ShellCheck, Hadolint |
| **[Build](.github/workflows/build.yaml)** | Push / PR | Test-build changed add-ons on all architectures |
| **[Validate](.github/workflows/validate-addon.yaml)** | PR | Verify add-on directory structure and required files |
| **[Release](.github/workflows/release.yaml)** | Push to main | Detect version bumps and create GitHub Releases |
| **[Publish](.github/workflows/publish.yaml)** | Release | Build and push Docker images to GHCR |
| **[Update Versions](.github/workflows/update-versions.yaml)** | Daily / manual | Check upstream releases and auto-create update PRs |
| **[Update README](.github/workflows/update-readme.yaml)** | Push to main | Auto-update the add-on table above |
| **[PR Labeler](.github/workflows/labeler.yaml)** | PR | Auto-label PRs by affected add-on |
| **[Stale](.github/workflows/stale.yaml)** | Daily | Clean up inactive issues and PRs |
| **[Dependabot](.github/dependabot.yml)** | Weekly | Keep GitHub Actions up to date |

### Release flow

```
PR with version bump in config.yaml
  -> merge to main
    -> release.yaml detects version change
      -> creates GitHub Release (e.g. uptime-kuma-v1.1.0)
        -> publish.yaml builds & pushes Docker images to GHCR
          -> update-readme.yaml updates the add-on table
```

## Development

### Creating a new add-on

The easiest way to start is to copy the **Dolly** template add-on:

```bash
cp -r dolly/ my-app/
```

Then customize each file in `my-app/`. See the
[Contributing Guide](CONTRIBUTING.md) for details.

### Add-on directory structure

```
my-app/
├── config.yaml          # Add-on metadata (name, version, arch, options)
├── build.yaml           # Base images per architecture
├── Dockerfile           # Container build instructions
├── apparmor.txt         # AppArmor security profile
├── DOCS.md              # User documentation
├── CHANGELOG.md         # Version history (Keep a Changelog format)
├── icon.png             # Add-on icon (128x128 recommended)
├── logo.png             # Add-on logo (256x256 recommended)
├── translations/
│   └── en.yaml          # English translations for options
├── upstream.yaml        # (optional) Upstream version tracking
└── rootfs/
    └── run.sh           # Entrypoint script using bashio
```

### Local testing

```bash
# Build
docker build \
  --build-arg BUILD_FROM="ghcr.io/home-assistant/amd64-base:3.21" \
  -t local/my-app ./my-app

# Run
docker run --rm -p 8080:8080 local/my-app
```

### CI pipeline

- Open a pull request - CI will lint, validate structure, and test-build
- Merge to main - bump the `version` in `config.yaml` to trigger a release

## License

MIT License - see [LICENSE](LICENSE) for details.
