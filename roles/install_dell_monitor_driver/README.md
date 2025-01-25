# install_dell_monitor_driver

- Install Dell monitor driver for U4025QW.
  - [Support for Dell U4025QW | Overview | Dell US](https://www.dell.com/support/product-details/en-us/product/u4025qw-monitor/overview)

## Requirements

- OS: macOS Only

## Role Variables

| Variable                                    | Required | Default            | Choices | Comments      |
|---------------------------------------------|----------|--------------------|---------|---------------|
| `install_dell_monitor_driver_sudo_password` | true     | `$BECOME_PASSWORD` | -       | sudo password |

## Dependencies

None

## Manual TODO

- open setting
  - `open "x-apple.systempreferences:com.apple.preference.displays"`
- Set Refresh Rate to `VRR(48 ~ 120)`
- Enable `High Dynamic Range`
