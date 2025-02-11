# misc_create_zshconf

The tiny role for create zsh config file into `~/.config/zsh`

## Requirements

None

## Role Variables

| Variable                  | Required | Default | Choices                                   | Comments |
|---------------------------|----------|---------|-------------------------------------------|----------|
| `misc_create_zshconf_src` | true     | -       | target filename in `files` or `templates` | -        |
| `misc_create_zshconf_cmd` | false    | -       | target command stdout for create file     | -        |

## Dependencies

None
