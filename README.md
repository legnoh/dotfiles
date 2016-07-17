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
$ gpg --import --allow-secret-key-import ~/Desktop/jp.legnoh.gpg
$ gpg --edit-key 232E422D trust quit
...
  1 = I don't know or won't say
  2 = I do NOT trust
  3 = I trust marginally
  4 = I trust fully
  5 = I trust ultimately
  m = back to the main menu
...
Your decision? 5

$ rm ~/Desktop/jp.legnoh.gpg
```
