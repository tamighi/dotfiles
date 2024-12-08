export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

my_fzf_dirs_widget() {
  local dirs
  dirs=$(find ~/Documents -maxdepth 2 -type d -print | fzf)
  if [[ -n "$dirs" ]]; then
    cd "$dirs"
    zle reset-prompt
  fi
}
zle -N my_fzf_dirs_widget
bindkey '^f' my_fzf_dirs_widget

alias brightness="xrandr --output HDMI-0 --brightness"
