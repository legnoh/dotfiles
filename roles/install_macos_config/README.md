# install_macos_config

Install macOS configurations and Shortcuts.

- [dsully/macos-defaults: A tool for managing macOS defaults declaratively via YAML files.](https://github.com/dsully/macos-defaults)
- [はてブする](https://www.icloud.com/shortcuts/fbd290c7e1c44286a2422f8c17a076ce)
- [LinkCopy(md)](https://www.icloud.com/shortcuts/4ac45afa7bae47e398fce01c6ee4727b) 
- [LinkCopy(rtf)](https://www.icloud.com/shortcuts/2056e1323aa0497080a482547707819b)

## Requirements

- OS: macOS Only

## Role Variables

None

## Dependencies

None

## Manual TODO

- システム設定
  - 一般
    - 情報
      - `コンピュータ名`: (分かりやすいものに変更)
    - ソフトウェアアップデート
      - `App Storeからのアプリケーションアップデートをインストール`: 有効
  - コントロールセンター
    - Spotlight → `メニューバーに非表示`
  - ディスプレイ
    - `ハイダイナミックレンジ`: 有効
    - Night Shift…
      - `スケジュール`: `日の入から日の出まで`
  - 壁紙
    - `空撮: すべてをシャッフル`
  - キーボード
    - キーボードショートカット
      - アプリのショートカット
        - `Safari.app`
          - `日本語に翻訳` → `⇧+⌘+J`
    - テキスト入力
      - `ユーザ辞書…` → `~/Downloads/dictionary.plist` をドラッグ&ドロップ
  - スクリーンタイム
    - デバイス間で共有: 有効
- Dock
  - `Finder`, `LaunchPad`, `Safari`, `セパレータ`, `ダウンロード`, `ゴミ箱` 以外の全アイコンを消す
  - `ダウンロード`: 表示形式: `フォルダ`
- Finder
  - サイドバーから「最近の項目」を削除する
  - 「"デスクトップ"と"書類"フォルダ」を有効化
  - 表示 → パスバーを表示する
- LaunchPad
  - 以下の順番で整理する
    1. `ボイスメモ` に `天気` を入れる(自動的に`ユーティリティ`というフォルダになる)
    1. `Keynote` に `Numbers` を入れる(自動的に`仕事効率化` というフォルダになる)
    1. それぞれに使わないデフォルトアプリをひたすら投げ込む
    1. 1枚目の整理が終わったら、2枚目、3枚目にあるアプリを1枚目に移動させる
- Safari
  - 一般
    - `Safariの起動時`: `最後のセッションのプライベートブラウズ以外の全ウィンドウ`
  - タブ
    - `タブのレイアウト`: `コンパクト`
    - `⌘+1から⌘+9でタブを切り替える`: 無効
  - 自動入力
    - `ユーザ名とパスワード` 以外無効
  - プライバシー
    - `サイト越えトラッキングを防ぐ`: 無効
  - 詳細
    - `Webサイトの完全なアドレスを表示`: 有効
    - `デフォルトのエンコーディング`: `Unicode(UTF-8)`
    - `Webデベロッパ用の機能を表示`: 有効
- ショートカット
  - 以下の3つをインポートする
    - [はてブする](https://www.icloud.com/shortcuts/fbd290c7e1c44286a2422f8c17a076ce)
    - [LinkCopy(md)](https://www.icloud.com/shortcuts/4ac45afa7bae47e398fce01c6ee4727b)
    - [LinkCopy(rtf)](https://www.icloud.com/shortcuts/2056e1323aa0497080a482547707819b)
