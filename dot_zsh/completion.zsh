# --------------------------
# 補完システムの初期化（キャッシュ活用）

fpath=(~/.zsh/completions $fpath)
autoload -Uz compinit
ZDOTDIR=${ZDOTDIR:-$HOME}

zcompdump="$HOME/.zcompdump"      # 補完キャッシュファイルの場所
if [[ ! -s $zcompdump || $zcompdump -ot $ZDOTDIR/.zshrc ]]; then
  compinit                        # 通常の補完初期化
else
  compinit -C                     # キャッシュを使った高速初期化
fi

# compinit の再初期化（Sheldon の後に行うことでプラグインの補完を有効に）
compinit
