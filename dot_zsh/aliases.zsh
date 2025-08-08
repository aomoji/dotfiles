# --------------------------
# abbr 一括登録（重複定義を避けて高速化）

# 展開後のカーソルの位置を % で指定できるようにする
ABBR_SET_EXPANSION_CURSOR=1

# 現在の定義済みの略語を1回だけ取得してキャッシュ
_abbr_list="$(abbr list)"

# 登録関数（未定義なら登録）
_abbr() {
  local name="$1"
  shift
  local expansion="$*"
  if ! grep -q "^\"${name}\"" <<<"$_abbr_list"; then
    abbr -f "$name=$expansion"
  fi
}

# --------------------------
_abbr myip 'curl http://ipecho.net/plain; echo'
_abbr vi nvim
_abbr lg lazygit
_abbr ls 'eza'
_abbr la 'eza -Glah'
_abbr lt 'eza -T'
_abbr o 'open'
_abbr less "bat --theme='Monokai Extended Bright' --paging always"
_abbr cat "bat --theme='Monokai Extended Bright'"
# git関連のalias
_abbr gs 'git status'
_abbr ga 'git add'
_abbr gc "git commit -m '%'"
_abbr gp "git push origin"
_abbr gw 'git switch'
_abbr gb 'git branch'
