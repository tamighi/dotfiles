# Prompt colors
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_ALL_DUPS

# Completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Aliases
alias l="ls -la"

#Plugins

## Syntax highlighting plugin
source ~/.local/share/zsh/zsh-syntax-highlighting.git/zsh-syntax-highlighting.zsh

## zsh-autosuggestions
source ~/.local/share/zsh/zsh-autosuggestions.git/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

## zsh-substring history search
source ~/.local/share/zsh/zsh-history-substring-search.git/zsh-history-substring-search.zsh
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
