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

config書き変えた後は、設定を反映させるためにコマンドを実行しておくこと。

```
:PackerCompile
```
