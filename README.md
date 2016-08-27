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

### VM
- [**PCF Dev**](https://network.pivotal.io/products/pcfdev)
  - ```cd ~/Downloads && unzip pcfdev-v* && rm -rf pcfdev-*.zip && ./pcfdev-* && cf dev start && rm -rf pcfdev-* && cd -```
  - **CLI:** ```cf login -a api.local.pcfdev.io --skip-ssl-validation -u admin -p admin```
  - **AppsManager:** https://local.pcfdev.io/



- [**Concourse**](http://concourse.ci/vagrant.html)
  - ```mkdir -p ~/src/vagfiles/concourse && cd ~/src/vagfiles/concourse && vagrant init concourse/lite && vagrant up && cd -```
  - ```curl -o fly -L http://192.168.100.4:8080/api/v1/cli\?arch=amd64\&platform=darwin && chmod 755 fly && mv fly /usr/local/bin/fly```
  - **CLI:** ```fly -t lite login -c http://192.168.100.4:8080```
  - **GUI:** http://192.168.100.4:8080/

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
