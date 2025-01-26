# uninstall_everything(experimental/TBD)

> [!CAUTION]
> This role is not working! Don't use it!

Uninstall all brew/cask/mas application and remove files.

## Requirements

- OS: macOS Only

## Role Variables

| Variable                         | Required | Default            | Choices | Comments      |
|----------------------------------|----------|--------------------|---------|---------------|
| `uninstall_everything_sudo_pass` | true     | `$BECOME_PASSWORD` | -       | sudo password |

## Dependencies

None

## Manual TODO

- [What to do before you sell, give away, or trade in your Mac \- Apple Support](https://support.apple.com/en-us/HT201065)
  - [Erase your Mac and reset it to factory settings \- Apple Support](https://support.apple.com/en-us/102664)
  - [How to reinstall macOS \- Apple Support](https://support.apple.com/en-us/102655)
