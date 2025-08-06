# --------------------------
# 履歴関連の設定（多くの履歴を保持し、共有・便利に扱えるようにする）

HISTFILE=~/.history               # 履歴ファイルの保存先
HISTSIZE=100000                   # メモリ内履歴の最大件数
SAVEHIST=100000                   # 保存される履歴の件数

setopt BANG_HIST                  # ! で履歴展開（例: !!, !ls）
setopt INC_APPEND_HISTORY         # 実行直後に履歴をファイルに追加（セッション間共有のため）
setopt HIST_IGNORE_DUPS           # 直前と同じコマンドは履歴に追加しない
setopt HIST_FIND_NO_DUPS          # 履歴検索で重複をスキップ
setopt SHARE_HISTORY              # 複数のシェル間で履歴を共有
setopt HIST_REDUCE_BLANKS         # 不要な空白を除去して履歴をきれいに
