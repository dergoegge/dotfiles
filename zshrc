export ZSH=$HOME/dotfiles/oh-my-zsh

#ZSH_THEME=""

plugins=(git web-search python wd osx brew zsh-syntax-highlighting)

# bind alt-left/right for moving wordwise in commands
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

source $ZSH/oh-my-zsh.sh
[[ $- = *i* ]] && source ~/dotfiles/liquidprompt/liquidprompt
source ~/dotfiles/aliases
source ~/dotfiles/functions
source ~/dotfiles/fzfrc
source ~/dotfiles/environment
source ~/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc" ; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

if [[ ! $TERM =~ xterm-256 ]]; then
  tmux attach || tmux new
fi
