dotfiles
========

٩( 'ω' )و  MY DOTFILES  ٩( 'ω' )و

```
$ bash -c "$(curl -L l.cfapps.io)"
```

## infomation
- zsh + zplug, Jetbrains IDEs
- docker + docker-compose
- anyenv

### ssh
```bash
$ open ~/.ssh
$ chmod 400 ~/.ssh/jp.legnoh.ssh && ssh-add -K ~/.ssh/jp.legnoh.ssh
```
- Open GPG Keychain , drop gpg file, and change to "Ultimate"

### manual install
- [**BTT Settings**](https://raw.githubusercontent.com/legnoh/dotfiles/master/pkg/btt-presets.json)
  - `open ~/code/src/github.com/legnoh/dotfiles/pkg/`
- [**PopClip**](http://pilotmoon.com/popclip/extensions/)
  - Open Link
  - Search
  - Copy
  - [Paste and Match Style](http://pilotmoon.com/popclip/extensions/ext/PasteAndMatch.popclipextz)
  - [Google Translate](http://pilotmoon.com/popclip/extensions/ext/GoogleTranslate.popclipextz)
  - [UnixTimeJP](https://github.com/legnoh/unixtime-jp.popclipext/releases/download/v1.0/unixtime-jp.zip)

### essential

- `conpose` ... local concourse in docker-compose c.f.) `conpose up`, `conpose stop`
- other's db is ready. check in `docker` directory!

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
