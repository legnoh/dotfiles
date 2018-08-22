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
- シェルはzsh(zplug), テキストエディタはAtom(apm)で統一し、パッケージマネージャを利用
- 設定類の同期にはMackupをdotfilesを経由する形で利用
- 言語ランタイム環境はanyenvを使う
  - ただし、Java/Goについてはbrew/caskから直接インストールする
- Windows環境のセットアップは未定。Chocolateyを使うところまでは決定

### SSH
```bash
$ open ~/.ssh
$ chmod 400 ~/.ssh/jp.legnoh.ssh && ssh-add -K ~/.ssh/jp.legnoh.ssh
```
- GPG Keychainを開いてGPG鍵を放り込み、鍵の信頼度を「Ultimate」に変更しておく

### local PF
- [**PCF Dev**](https://network.pivotal.io/products/pcfdev)
  - `pcfdev-start`
  - **CLI:** `cfldev`
  - **AppsManager:** https://local.pcfdev.io/

### local DB/S3
- 3306 : [**MariaDB**](https://hub.docker.com/_/mariadb/)
  - `maria-start`
- 5432 : [Postgres](https://hub.docker.com/_/postgres/)
  - `pstgr-start`
- 6379 : [**Redis**](https://hub.docker.com/_/redis/)
  - `redis-start`
- 9000 : [**Minio**](https://hub.docker.com/r/minio/minio/)
  - `minio-start`
  - http://localhost:9000/
  - [help/en/howto/minio – Cyberduck](https://trac.cyberduck.io/wiki/help/en/howto/minio)

### manual install
- [**BTT Settings**](https://raw.githubusercontent.com/legnoh/dotfiles/master/pkg/btt-presets.json)
  - `open ~/code/src/github.com/legnoh/dotfiles/pkg/`
- [**PopClip**](http://pilotmoon.com/popclip/extensions/)
  - Open Link
  - [Open in Firefox](http://pilotmoon.com/popclip/extensions/ext/OpenInFirefox.popclipextz)
  - Search
  - Copy
  - [Paste and Match Style](http://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz)
  - [Google Translate](http://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz)
  - [UnixTimeJP](https://github.com/legnoh/unixtime-jp.popclipext/releases/download/v1.0/unixtime-jp.zip)

#### (private only)
- [**Serato DJ**](https://serato.com/dj/downloads/mac)
- [**Studio One 3 Prime**](https://my.presonus.com/products/software)
- [**VOCALOID**](https://www.vocaloid.com/articles/activation_deactivation_02#phase01)
  - [VOCALOID製品のアクティベーションについて \| サポート \| VOCALOID \( ボーカロイド・ボカロ \)](https://www.vocaloid.com/articles/online_activation#Mac)


### initialize mac
- [iTunes](https://support.apple.com/ja-jp/HT204385)
  - `アカウント > 認証 > このコンピュータの認証を解除`
- [icloud.com](https://www.icloud.com/#settings)
  - 「マイデバイス」から対象の端末を削除
- iMassage
  - メインアカウントをサインアウトする
- [macOS を再インストールする方法 \- Apple サポート](https://support.apple.com/ja-jp/HT204904)
  - "opt + command + R"で起動
  - "ディスクユーティリティ"を起動し、ルートディスクを選択して消去
  - macOS を再インストール

#### (private only)
- [**VOCALOID**](https://www.vocaloid.com/articles/activation_deactivation_02#phase02)
    - [VOCALOID製品のディアクティベーションについて \| サポート \| VOCALOID \( ボーカロイド・ボカロ \)](https://www.vocaloid.com/articles/online_deactivation#Mac)
