# install_vscode

Install Visual Studio Code and configurations.

## Requirements

- OS: macOS Only
- Role:
  - `install_zsh_config`
  - `install_git_packages`

## Role Variables

| Variable                        | Required | Default | Choices         | Comments               |
|---------------------------------|----------|---------|-----------------|------------------------|
| `install_vscode_go_version`     | false    | *1      | -               | desired go version     |
| `install_vscode_node_version`   | false    | *1      | -               | desired node version   |

- *1: Check in [defaults/main.yml](./defaults/main.yml)

## Dependencies

None

## Manual TODO

None
