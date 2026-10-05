# install_lima

Install Lima for Mac.
  
- VM: [lima-vm/lima: Linux virtual machines, with a focus on running containers](https://github.com/lima-vm/lima)

## Requirements

- OS: macOS Only
- Role:
  - `install_zsh_config`

## Role Variables

| Variable                           | Required | Default  | Choices    | Comments                       |
|------------------------------------|----------|----------|------------|--------------------------------|
| `install_lima_docker_cpus`         | no       | `4`      | -          | VM CPU Cores                   |
| `install_lima_docker_memory`       | no       | `4GiB`   | -          | VM Memory                      |
| `install_lima_docker_disk`         | no       | `100GiB` | -          | VM Disk                        |
| `install_lima_instance_name`       | no       | `docker` | -          | VM Instance Name               |
| `install_lima_recreate_instance`   | no       | `false`  | true/false | Recreate VM Instance           |

## Dependencies

None

## Manual TODO

None
