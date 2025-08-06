# dotfiles

## 前提条件

* macOSを利用している
* gitがインストールされている

## 導入手順

chezmoiのインストールとdotfilesの反映は次の通り行う。

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply aomoji
```
