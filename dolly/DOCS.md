# Dolly - Template Add-on

## About

Dolly is a **template add-on** designed to be cloned and customized when
creating new Home Assistant add-ons. It demonstrates all the best practices
for add-on development including ingress, configuration management,
health checks, and security profiles.

The name "Dolly" comes from the famous cloned sheep - fitting for a
template meant to be copied!

## Installation

This add-on is available in the Adriano's Home Assistant Add-ons repository.
After adding the repository, find "Dolly" in the add-on store and click Install.

## Configuration

```yaml
log_level: info
greeting_message: "Hello from Dolly!"
```

### Option: `log_level`

Controls the verbosity of logging. Valid values: `trace`, `debug`, `info`,
`warning`, `error`, `fatal`.

### Option: `greeting_message`

The message displayed on the welcome page. Customize it to verify your
configuration is working.

## Using as a Template

To create a new add-on based on Dolly:

1. Copy the `dolly/` directory: `cp -r dolly/ my-addon/`
2. Update `config.yaml` with your add-on's name, slug, description, and ports
3. Update `build.yaml` with appropriate labels
4. Replace the `Dockerfile` with your application's build steps
5. Modify `rootfs/run.sh` with your application's startup logic
6. Update `DOCS.md`, `CHANGELOG.md`, and `translations/en.yaml`
7. Replace `icon.png` and `logo.png` with your add-on's branding
8. Update `apparmor.txt` to match your application's needs

## Support

For issues, open a ticket at:
<https://github.com/adrianoamalfi/hassos-apps/issues>
