# Define the custom widget function
my_fzf_dirs_widget() {
  local dirs
  dirs=$(find ~/Documents/learning ~/Documents/projects -maxdepth 1 -type d -print | fzf)
  if [[ -n "$dirs" ]]; then
    cd "$dirs"
  fi
}

zle -N my_fzf_dirs_widget

# Bind the custom widget to <C-f>
bindkey '^f' my_fzf_dirs_widget
