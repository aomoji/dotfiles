# --------------------------
# ディレクトリ移動の利便性向上

setopt AUTO_CD                    # ディレクトリ名を入力するだけで cd 可能
setopt AUTO_PUSHD                 # cd を pushd として扱い、ディレクトリ履歴に追加
setopt PUSHD_IGNORE_DUPS          # 重複したディレクトリは履歴に追加しない

# --------------------------
# ユーザー補助

setopt CORRECT                    # コマンドのスペルミスを補完候補として修正提案
setopt NO_BEEP                    # エラー時などのベル音を鳴らさない（静音化）
