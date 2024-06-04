# Alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ls='eza'
alias la='eza -Glah'
alias lt='eza -T'
alias fc='cd "$(find . -type d | sk)"'
alias vi='nvim'
alias o='open'
alias less="bat --theme='Monokai Extended Bright' --paging always"
alias cat="bat --theme='Monokai Extended Bright'"

# 過去のコマンドの一覧
function sk-history-selection() {
    BUFFER=$(history 1 | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\*?\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | sk --query "$LBUFFER")
    CURSOR=${#BUFFER}
    zle reset-prompt
}
zle -N sk-history-selection
bindkey '^R' sk-history-selection

# ディレクトリ移動時にlsの結果を表示する
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
function ls-chpwd {
  local ls_result
  ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS ls -CGF)
  local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')
  if [ $ls_lines -gt 10 ]; then
    echo "$ls_result" | head -n 3
    echo ' :'
    echo "$ls_result" | tail -n 3
    echo "$(ls -1 | wc -l | tr -d ' ') files exist"
  else
    echo "$ls_result"
  fi
}
add-zsh-hook chpwd ls-chpwd

# cdrのリストを表示
# ### search a destination from cdr list
function sk-get-destination-from-cdr() {
  cdr -l | \
  sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
  awk '{c=gsub("/","/"); print c,length($0),$0}' | \
  sort -n | \
  cut -d' ' -f3- | \
  sk --query "$LBUFFER"
}
### search a destination from cdr list and cd the destination
function sk-cdr() {
  local destination="$(sk-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N sk-cdr
bindkey '^x' sk-cdr

#skでkill
function sk-pkill() {
  for pid in `ps aux | sk | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias skkill="sk-pkill"

# wezterm
export PATH="/Applications/WezTerm.app/Contents/MacOS:$PATH"
# starship
eval "$(starship init zsh)"

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \

# ---------------------------------------------------------
# plugin list
# ---------------------------------------------------------

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light chrissicool/zsh-256color

### End of Zinit's installer chunk

# pyenv
eval "$(direnv hook zsh)"
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
