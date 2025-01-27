# install_scansnap

Install Scansnap Home.

- [ScanSnap Home - Scan Snap Home Software Application Available Online](https://www.pfu-us.ricoh.com/scanners/scansnap/solutions/scansnap-home)

## Requirements

- OS: macOS Only

## Role Variables

| Variable                         | Required | Default            | Choices | Comments      |
|----------------------------------|----------|--------------------|---------|---------------|
| `install_scansnap_sudo_password` | true     | `$BECOME_PASSWORD` | -       | sudo password |

## Dependencies

None

## Manual TODO

- [ ] install profile
  - `~/Downloads/scansnap-profiles.ssmp`
- [ ] Config
  - 一般
    - `macへのログイン時にScanSnap Homeを起動します`: 無効
  - スキャン時の動作
    - `ScanSnapの電源ON時に、スキャン画面を自動的に表示します`: 有効
    - `スキャンデータの保存完了を通知します`: 無効
  - `メニューバーにアイコンを表示します`: 無効
