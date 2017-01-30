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

### VM/Docker
- [**PCF Dev**](https://network.pivotal.io/products/pcfdev)
  - ```cd ~/Downloads && unzip pcfdev-v* && rm -rf pcfdev-*.zip && ./pcfdev-* && cf dev start && rm -rf pcfdev-* && cd -```
  - **CLI:** ```cf login -a api.local.pcfdev.io --skip-ssl-validation -u admin -p admin```
  - **AppsManager:** https://local.pcfdev.io/

- [**Concourse**](http://concourse.ci/vagrant.html)
  - ```mkdir -p ~/src/concourse && cd ~/src/concourse && vi docker-compose.yml```
    - [docker-compose.yml](http://concourse.ci/docker-repository.html)
  - ```curl -o fly -L http://192.168.100.4:8080/api/v1/cli\?arch=amd64\&platform=darwin && chmod 755 fly && mv fly /usr/local/bin/fly```
  - **CLI:** ```fly -t lite login -c http://192.168.100.4:8080```
  - **GUI:** http://192.168.100.4:8080/

### SSH
```bash
$ open ~/.ssh
$ chmod 400 ~/.ssh/jp.legnoh.ssh && ssh-add -K ~/.ssh/jp.legnoh.ssh
```
- GPG Keychainを開いてGPG鍵を放り込み、鍵の信頼度を「Ultimate」に変更しておく

### Pleiades
- [mergedoc.osdn.jp/pleiades-redirect/4.6/pleiades_platform-mac_jre.zip.html](http://mergedoc.osdn.jp/pleiades-redirect/4.6/pleiades_platform-mac_jre.zip.html)

### GVM
```
$ bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
$ gvm install go1.7.3 -B && gvm use go1.7.3 --default
```

### Oracle Database
- [Oracle SQL Developer](http://www.oracle.com/technetwork/jp/developer-tools/sql-developer/downloads/index.html)
- [Instant Client](http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html)
```
cd ~/Downloads \
&& unzip instantclient-basic-macos.x64-12.1.0.2.0.zip \
&& unzip instantclient-sqlplus-macos.x64-12.1.0.2.0.zip \
&& mv instantclient_12_1 $HOME/Applications/ \
&& cd $HOME/Applications/instantclient_12_1 \
&& ln -s libclntsh.dylib.12.1 libclntsh.dylib \
&& ln -s libocci.dylib.12.1 libocci.dylib \
&& rr
```


### ウイルス対策
環境によって異なるので、必要な場合はavastを導入する。
```bash
$ brew cask install avast
```
