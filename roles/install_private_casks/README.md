# install_private_casks

Install Private applications(not for business purpose).

- [BetterZip 5 - MacItBetter](https://macitbetter.com/)
- [OBS - Open Broadcaster Software](https://obsproject.com/)
- [Discord - Group Chat That’s All Fun & Games](https://discord.com/)

## Requirements

- OS: macOS Only
- **Not for commercial use**

## Role Variables

| Variable                          | Required | Default            | Choices | Comments      |
|-----------------------------------|----------|--------------------|---------|---------------|
| `install_private_casks_sudo_pass` | true     | `$BECOME_PASSWORD` | -       | sudo password |

## Dependencies

None

## Manual TODO

- [ ] Login to discord
- [ ] Setup your OBS profile(TBD)
