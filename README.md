# dotfiles

## 前提条件

* macOSを利用している
* gitがインストールされている

## 導入手順

chezmoiのインストールとdotfilesの反映は次の通り行う。

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply aomoji
```

## 導入後のパッケージの追加

cargoで管理するパッケージの追加インストールは以下を実行する。

```sh
sh ./run_once_install_cargo_tools.sh.tmpl
```

homebrewで管理するパッケージの追加インストールは以下を実行する。

```sh
brew bundle --file="${HOME}/.Brewfile"
```
