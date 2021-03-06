#!/usr/bin/env zsh

if [[ "$TERM" == "alacritty" ]]; then
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

eval $(thefuck --alias)

# Load all of my zsh files in zsh/
for zsh_file (~/dotfiles/zsh/*.zsh) source $zsh_file

# Load private configuration
source ~/.zshrc.local

if [[ "$TERM" == "alacritty" ]]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
  [[ ! -f ~/dotfiles/p10k.zsh ]] || source ~/dotfiles/p10k.zsh
fi

source ~/.fzf.zsh

# Ctrl+e = Ctrl+r. Must be after ~/.fzf.zsh, which seems to need to be near the end :-/
bindkey '^E' fzf-history-widget
