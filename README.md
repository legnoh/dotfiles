:innocent: dotfiles :sunglasses:
========

[![Static Badge](https://img.shields.io/badge/anslble--galaxy-legnoh.dotfiles-blue?style=flat&logo=ansible)](https://galaxy.ansible.com/ui/repo/published/legnoh/dotfiles/)

```
zsh -c "$(curl -L ansible.lkj.io)"
source ~/.zprofile
zsh -c "$(curl -L dot.lkj.io)"
```

## goods

- Shell: [Zsh](http://www.zsh.org/)
  - prompt manager: [Starship](https://starship.rs)
- IDE: [Visual Studio Code](https://code.visualstudio.com/)
- Container Runtime: [Rancher](https://www.rancher.com)
- Color Scheme: [Iceberg](https://cocopon.github.io/iceberg.vim/)
- Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/) [Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
- and some macOS applications & drivers!
  - jq/yq/ghq
  - GitHub CLI
  - 1Password
  - Raycast
  - Dell monitor driver(U4025QW)
  - Logi Options+
  - Roland BRIDGE CAST
  - ScanSnap Home
  - ...
- Deployed by: [Ansible](https://docs.ansible.com)

<details>
  <summary>Policies</summary>
  
- 12Factorの思想に基づき、インストール・設定のタイミングと利用のタイミングは明確に分離する。
  - zshプラグインマネージャによく見られる、シェル起動時にデータ取得するツールは採用せず、brewで事前にインストールする。
- エイリアスを使わず、すべてのファイルはansibleによって実体を配布する。
- 言語バージョンマネージャ(nvm,asdf等)は利用しない。
  - 常にローカルはLTSの最新バージョンにアップデートすべきである。
  - 仮想環境内で利用バージョンを切り替えられ、かつアップデートで壊れやすい言語(例: uv)に限り活用しても良い。
    - できない場合は一時的にbrew経由で古いバージョンにダウングレードしたり、全プロジェクトの利用バージョンを一括アップデートする。
- 手動インストールが必要な手順は、スティッキーズなどで画面上に情報を掲載するのが望ましい。
- masのアプリインストールなど、時間がかかる部分は非同期処理(async/poll)を利用するのが望ましい。
- 基本的にはOS標準のソフトウェアを使うべきだが、力不足な場合は外部ソフトウェアで補うのが望ましい。
- 凝りすぎない。シンプルで同じ端末を使う誰もが気軽に真似できる構成であるのが望ましい。

</details>

## Debug

```
git clone https://github.com/legnoh/dotfiles.git && dotfiles
ansible-playbook site-local.yml -t "install_foo" -v
```
