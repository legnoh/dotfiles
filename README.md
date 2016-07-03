dotfiles
========

٩( 'ω' )و  MY DOTFILES  ٩( 'ω' )و

```
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/legnoh/dotfiles/master/setup.sh)"
```

## policy
- サーバにおけるインストール作業、モダン化できることならなんでも取り入れる
  - コマンドがあるのなら自動化しておく精神で
- OS間の違いを吸収できる仕組みを内包しているパッケージマネージャ系は単独導入
- それ以外のツールはそのOSにおけるパッケージマネージャ経由での導入をベースにする
- シェルはzsh(zplug), テキストエディタはAtom/Nuclide(apm)で統一し、パッケージマネージャを利用
- 言語ランタイム環境はanyenvを使う形で統一
- Windows環境のセットアップは未定。Chocolateyを使うところまでは決定
