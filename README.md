dotfiles
========

٩( 'ω' )و  MY DOTFILES  ٩( 'ω' )و

```
$ bash -c "$(curl -L l.cfapps.io)"
```

## policy
- サーバにおけるインストール作業、モダン化できることならなんでも取り入れる
  - コマンドがあるのなら自動化しておく精神で
- 基本は、そのOSにおけるパッケージマネージャ経由での導入をベースにする
- シェルはzsh(zplug), テキストエディタはAtom/Nuclide(apm)で統一し、パッケージマネージャを利用
- 設定類の同期にはMackupを利用
- 言語ランタイム環境はanyenvを使う形で統一
- Windows環境のセットアップは未定。Chocolateyを使うところまでは決定

##  手動導入
- Twitter
  - 「設定」->「その他」で新規ツイートのグローバルショートカットが可能（⌘⌥⌃+T に設定する）

### Download
- [**PCF Dev**](https://network.pivotal.io/products/pcfdev)
- [**SimpleComic**](http://dancingtortoise.com/simplecomic/)
- [**TDEnc2**](http://tdenc.com/TDEnc2/download/)

### SSH
```bash
$ open ~/.ssh
$ chmod 400 ~/.ssh/jp.legnoh.ssh && ssh-add -K ~/.ssh/jp.legnoh.ssh
```
- GPG Keychainを開いてGPG鍵を放り込み、鍵の信頼度を「Ultimate」に変更しておく

### ウイルス対策
環境によって異なるので、必要な場合はavastを導入する。
```bash
$ brew cask install avast
```
