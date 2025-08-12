# dotfiles

## 前提条件

* macOSを利用している
* gitがインストールされている

## 導入手順

chezmoiのインストールとdotfilesの反映は次の通り行う。

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply aomoji
```

## 導入後のパッケージの追加・更新

1. パッケージの追加
    * homebrew: dot_Brewfileに追記
    * cargo: packages.txtに追記
1. 適用する
    ```sh
    chezmoi -v apply
    ```
