dotfiles
========

٩( 'ω' )و  MY DOTFILES  ٩( 'ω' )و

```
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/legnoh/dotfiles/master/setup.sh)"
```

## policy
- サーバにおけるインストール作業、モダン化できることならなんでも取り入れる
  - コマンドがあるのなら自動化しておく精神で
- 基本は、そのOSにおけるパッケージマネージャ経由での導入をベースにする
- シェルはzsh(zplug), テキストエディタはAtom/Nuclide(apm)で統一し、パッケージマネージャを利用
- 言語ランタイム環境はanyenvを使う形で統一
- Windows環境のセットアップは未定。Chocolateyを使うところまでは決定

##  手動導入

### MacAppStore
- [**Airmail**](https://itunes.apple.com/jp/app/id918858936)
- [**DesktopCalendarPlus**](https://itunes.apple.com/jp/app/id524688159)
- [**Eggy**](https://itunes.apple.com/jp/app/id564780170)
  - 非公開になったため「購入済み」の方から導入する(´・ω・`)
- [**Kobito**](https://itunes.apple.com/jp/app/id896624060)
- [**LINE**](https://itunes.apple.com/jp/app/id539883307)
- [**OmniGraffle**](https://itunes.apple.com/jp/app/id711830901)
  - AppStore版から通常版に移行可能なら良いのだが...
- [**PDF Outliner**](https://itunes.apple.com/jp/app/id420874236)
- [**PopClip**](https://itunes.apple.com/jp/app/id445189367)
  - [Extension](https://pilotmoon.com/popclip/extensions/)
- [**ReceiptKeeper**](https://itunes.apple.com/jp/app/id413449473)
- [XCode](https://itunes.apple.com/jp/app/id497799835)

### Download
- [**PCF Dev**](https://network.pivotal.io/products/pcfdev)
- [**SimpleComic**](http://dancingtortoise.com/simplecomic/)
- [**TDEnc2**](http://tdenc.com/TDEnc2/download/)

### SSH,GPG
```bash
$ open ~/.ssh
$ chmod 400 ~/.ssh/jp.legnoh.ssh
$ ssh-add -K ~/.ssh/jp.legnoh.ssh
$ gpg2 --import --allow-secret-key-import ~/Desktop/jp.legnoh.gpg
$ gpg2 --edit-key 232E422D

gpg> trust
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
