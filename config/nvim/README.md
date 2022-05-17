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

`Removing the following directories?`には`y`を選択する。

初回は、エラーが出ることがある(プラグインの読み込む順番が正しくないと思う)けどNeovimを再起動して、何度か実行してみると全部インストール出来ると思う。
また、コマンド実行時にE5108エラーが発生する場合があるが、その場合はNeovimを再起動して再度実行してみると良い。
おそらく`Packer.nvim`を遅延読み込みをしているのが原因で、コマンド実行時にプラグインが読み込まれていない可能性がある。

config書き変えた後は、設定を反映させるためにコマンドを実行しておくこと。

```
:PackerCompile
```
