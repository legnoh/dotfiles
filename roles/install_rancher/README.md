# install_rancher

Install Rancher Desktop for Mac.

- [Rancher Desktop by SUSE](https://rancherdesktop.io/)
  - With [VZ emulation](https://docs.rancherdesktop.io/ui/preferences/virtual-machine/emulation#vz) and [virtiofs volume](https://docs.rancherdesktop.io/ui/preferences/virtual-machine/volumes#virtiofs)

## Requirements

- OS: macOS Only
- Role:
  - `install_zsh_config`

## Role Variables

| Variable                              | Required | Default  | Choices    | Comments                       |
|---------------------------------------|----------|----------|------------|--------------------------------|
| `install_rancher_memory_in_gb`        | no       | `4`      | -          | Rancher VM Memory(GB)          |
| `install_rancher_number_cpus`         | no       | `2`      | -          | Rancher CPU Cores              |
| `install_rancher_start_in_background` | no       | `true`   | true/false | Enable start in background     |

## Dependencies

None

## Manual TODO

None
