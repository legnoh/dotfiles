# install_logi_options_plus

Install Logi Options+.

- [MX Software - Logi Options+ App | Logitech](https://www.logitech.com/en-us/mx/mx-software.html)

## Requirements

- OS: macOS Only

## Role Variables

| Variable                                  | Required | Default            | Choices | Comments      |
|-------------------------------------------|----------|--------------------|---------|---------------|
| `install_logi_options_plus_sudo_password` | true     | `$BECOME_PASSWORD` | -       | sudo password |

## Dependencies

None

## Manual TODO

- [ ] Login to logi account
- Setting
  - Mice: MX Master 3S
    - Buttons
      - [ ] Gestures: `Custom`
        - HOLD + MOVE LEFT: `Desktop right`
        - HOLD + MOVE RIGHT: `Desktop left`
        - HOLD + MOVE UP: `Keyboard shortcut` → `Opt + Space`(Raycast)
        - HOLD + MOVE DOWN: `Close Window`
        - CLICK: `Mission Control`
  - Keyboard: MX Mechanical Mini for Mac
    - (do nothing)
