# Contributing

Contributions are welcome!

## How to contribute

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-addon`)
3. Follow the add-on structure from `example-addon`
4. Ensure your add-on passes linting: the CI will run automatically on PR
5. Submit a pull request

## Add-on requirements

- Must include `config.yaml`, `Dockerfile`, `DOCS.md`, and `CHANGELOG.md`
- Must support `amd64` and `aarch64` architectures
- Must use semantic versioning
- Must pass all CI checks (lint, build)

## Code style

- Shell scripts must pass ShellCheck
- Dockerfiles must pass Hadolint
- YAML files must be valid and follow the yamllint config
