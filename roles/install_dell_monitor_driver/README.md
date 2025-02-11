# install_dell_monitor_driver

- Install DDPM and Dell monitor driver for [U4025QW](https://www.dell.com/en-us/shop/dell-ultrasharp-40-curved-thunderbolt-hub-monitor-u4025qw/apd/210-bmdp/monitors-monitor-accessories).
  - [Dell Display and Peripheral Manager for macOS | Dell US](https://www.dell.com/support/kbdoc/en-us/000201067/dell-display-and-peripheral-manager-for-macos?lwp=rt)
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

## Appendix

- [Command-Line Interface for Dell Display Manager Remote Management | Dell US](https://www.dell.com/support/kbdoc/en-us/000060112/what-is-dell-display-manager#commandline)
