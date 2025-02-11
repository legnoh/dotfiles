# install_ssh_config

Create `~/.ssh/config` and `~/.config/ssh`.

## Requirements

None

## Role Variables

None

## Dependencies

None

## Manual TODO

None

## Appendix

### Concept: Modular SSH Configuration for Enhanced Flexibility

This Role is responsible only for placing the .ssh/config file, which contains the following single line:

```
Include ~/.config/ssh/*
```

This configuration means that any files placed within this directory by other Ansible Roles will be automatically enabled.
With this mechanism, other Ansible Roles can freely place the necessary SSH configuration files as required.
