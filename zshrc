export ZSH=$HOME/dotfiles/oh-my-zsh

ZSH_THEME="af-magic"

plugins=(git web-search python wd osx brew zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source ~/dotfiles/aliases
source ~/dotfiles/functions
source ~/dotfiles/fzfrc
source ~/dotfiles/environment
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc" ; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

if [[ ! $TERM =~ screen ]]; then
  tmux attach || tmux new
fi
