## References

[nvim-lua-guide](https://github.com/willelz/nvim-lua-guide-ja/blob/master/README.ja.md)

## Install

Neovimのconfigを配置する。

```
rm -rf ~/.config/nvim
cp -r ../nvim ~/.config
```

Packer.nvimを使ってプラグインをインストールする。
Neovimを起動して、コマンドを実行する。

```
:PackerSync
```

初回は、エラーが出ることがある(プラグインの読み込む順番が正しくないと思う)けどNeovimを再起動して、何度か実行してみると全部インストール出来ると思う。

config書き変えた後は、設定を反映させるためにコマンドを実行しておくこと。

```
:PackerCompile
```
