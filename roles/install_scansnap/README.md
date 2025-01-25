# install_scansnap

Install Scansnap Home.

- [ScanSnap Home - Scan Snap Home Software Application Available Online](https://www.pfu-us.ricoh.com/scanners/scansnap/solutions/scansnap-home)

## Requirements

- OS: macOS Only

## Role Variables

| Variable                         | Required | Default            | Choices | Comments      |
|---------------------- -----------|----------|--------------------|---------|---------------|
| `install_scansnap_sudo_password` | true     | `$BECOME_PASSWORD` | -       | sudo password |

## Dependencies

None

## Manual TODO

- [ ] install profile
  - `~/Downloads/scansnap-profiles.ssmp`
