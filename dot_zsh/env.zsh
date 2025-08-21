# 使用するシェルを zsh に指定
export SHELL=$(command -v zsh)
# PATHの追加
export PATH=""$HOME/.local/bin:$PATH""
# ctrl+wで1つ前のスラッシュまで削除する
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>'
