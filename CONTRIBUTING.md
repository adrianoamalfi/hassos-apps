# Contributing

Contributions are welcome! This guide explains how to add a new add-on or
improve an existing one.

## Creating a new add-on

### 1. Copy the template

Start from the **Dolly** template add-on:

```bash
cp -r dolly/ my-addon/
```

### 2. Customize the files

Update each file in your new add-on directory:

| File | What to change |
|------|---------------|
| `config.yaml` | Name, slug, description, ports, options, image |
| `build.yaml` | OCI labels (title, description) |
| `Dockerfile` | Install your application and its dependencies |
| `rootfs/run.sh` | Startup logic: read config, set env vars, exec app |
| `DOCS.md` | User-facing documentation |
| `CHANGELOG.md` | Start with your initial release |
| `translations/en.yaml` | Descriptions for each configuration option |
| `apparmor.txt` | Adjust permissions for your application |
| `icon.png` / `logo.png` | Replace with your add-on's branding |

### 3. (Optional) Add upstream tracking

If your add-on wraps an upstream project, create `upstream.yaml`:

```yaml
repo: owner/repo-name
version_arg: MY_APP_VERSION
tag_prefix: "v"
```

This enables the daily [Update Versions](.github/workflows/update-versions.yaml)
workflow to automatically detect new upstream releases and create update PRs.

### 4. Open a pull request

CI will automatically:
- Lint your YAML, Dockerfile, and shell scripts
- Validate the add-on directory structure
- Test-build for all supported architectures

### 5. Release

After merging, bump the `version` field in `config.yaml` (in a follow-up PR
or the same PR). This triggers the automated release and publish pipeline.

## Add-on requirements

- Must include: `config.yaml`, `build.yaml`, `Dockerfile`, `DOCS.md`,
  `CHANGELOG.md`, `rootfs/run.sh`, `translations/en.yaml`
- Must support `amd64` and `aarch64` architectures
- Must use semantic versioning (X.Y.Z)
- Must pass all CI checks (lint, build, validate)

## Naming conventions

- **Directory name**: lowercase with hyphens (e.g., `my-addon`)
- **Slug**: lowercase with underscores (e.g., `my_addon`)
- **Image**: `ghcr.io/adrianoamalfi/{arch}-addon-{directory-name}`
- **Release tag**: `{directory-name}-v{version}` (e.g., `my-addon-v1.0.0`)

## Code style

- Shell scripts must pass [ShellCheck](https://www.shellcheck.net/)
- Dockerfiles must pass [Hadolint](https://github.com/hadolint/hadolint)
- YAML files must be valid and follow the yamllint config
- Use `bashio` for configuration reading and logging in `run.sh`

## Local testing

```bash
# Build for amd64
docker build \
  --build-arg BUILD_FROM="ghcr.io/home-assistant/amd64-base:3.21" \
  -t local/my-addon ./my-addon

# Run with a test port
docker run --rm -p 8080:8080 local/my-addon
```

## Repository setup (maintainers only)

The automated [Update Versions](.github/workflows/update-versions.yaml) workflow
creates pull requests when upstream releases are detected. It requires two
one-time configuration steps.

### 1. Allow GitHub Actions to create pull requests

Go to **Settings → Actions → General → Workflow permissions** and enable:

> Allow GitHub Actions to create and approve pull requests

This lets the built-in `GITHUB_TOKEN` create PRs as a fallback.

### 2. Create the `GH_PAT` secret (recommended)

PRs created with `GITHUB_TOKEN` do **not** trigger other workflow runs (lint,
build, validate). To have CI run automatically on auto-update PRs, store a
Personal Access Token as `GH_PAT` in **Settings → Secrets and variables →
Actions**.

**Classic PAT** (simplest):

1. Go to GitHub → **Settings → Developer settings → Personal access tokens →
   Tokens (classic)**
2. Click **Generate new token (classic)**
3. Select the **`repo`** scope (full control of private repositories)
4. Copy the token and save it as the `GH_PAT` secret in this repository

**Fine-grained PAT** (more secure):

1. Go to GitHub → **Settings → Developer settings → Personal access tokens →
   Fine-grained tokens**
2. Set **Resource owner** to `adrianoamalfi` and select this repository
3. Grant the following **Repository permissions**:
   - **Contents**: Read and Write
   - **Pull requests**: Read and Write
4. Copy the token and save it as the `GH_PAT` secret

> If `GH_PAT` is absent or left empty the workflow automatically falls back to
> `GITHUB_TOKEN`. PRs will still be created, but CI workflows will not run on
> them automatically.

## Resources

- [Home Assistant Add-on Development](https://developers.home-assistant.io/docs/add-ons)
- [Add-on Configuration](https://developers.home-assistant.io/docs/add-ons/configuration)
- [Add-on Communication](https://developers.home-assistant.io/docs/add-ons/communication)
- [Bashio Library](https://github.com/hassio-addons/bashio)
