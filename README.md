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

### SSH
```bash
$ open ~/.ssh
$ chmod 400 ~/.ssh/jp.legnoh.ssh && ssh-add -K ~/.ssh/jp.legnoh.ssh
```
- GPG Keychainを開いてGPG鍵を放り込み、鍵の信頼度を「Ultimate」に変更しておく

### local PF
- [**PCF Dev**](https://network.pivotal.io/products/pcfdev)
  - ```pdev-start```
  - **CLI:** ```cfldev```
  - **AppsManager:** https://local.pcfdev.io/

- [**Concourse**](http://concourse.ci/docker-repository.html)
  - ```conc-start```
  - **CLI:** ```fll```
  - **GUI:** http://localhost:50000/

### local DB/S3
- 3306 : [**MariaDB**](https://hub.docker.com/_/mariadb/)
  - ```maria-start```
- 5432 : [Postgres](https://hub.docker.com/_/postgres/)
  - ```psgl-start```
- 6379 : [**Redis**](https://hub.docker.com/_/redis/)
  - ```redis-start```
- 9000 : [**Minio**](https://hub.docker.com/r/minio/minio/)
  - ```minio-start```

### ウイルス対策
環境によって異なるので、必要な場合はavastを導入する。
```bash
$ brew cask install avast
```
