# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh

# Theme: Powerlevel10k
export ZSH_THEME="powerlevel10k/powerlevel10k"

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# Case-sensitive completion
export CASE_SENSITIVE="true"

# Disable autosetting terminal title
export DISABLE_AUTO_TITLE="true"

# Plugins
plugins=(git history cp vi-mode autojump dirpersist colorize)

source $ZSH/oh-my-zsh.sh

# iTerm2 integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Powerlevel10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Local environment (API keys, secrets - not checked into git)
[[ -f ~/.env.local ]] && source ~/.env.local

# tmux helper
function new-tmux-from-dir-name {
  dir_name=$(echo `basename $PWD` | tr '.' '-')
  tmux new-session -As $dir_name
}

# Aliases
alias tnew="new-tmux-from-dir-name"
alias szsh='source ~/.zshrc'
alias vzsh='vim ~/.dotfiles/homedir/.zshrc && szsh'
alias vtmux='vim ~/.dotfiles/homedir/.tmux.conf && tmux source-file ~/.tmux.conf'
alias vhs='cd ~/.hammerspoon/ && claude'
alias python='python3'
alias pip=pip3
alias tf='tail -f'
alias k9='kill -9'
alias psgrep='ps aux | grep'
alias claude="~/.local/bin/claude"
alias cerebral="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/cerebral && claude"

unsetopt correct

# bun
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# uv / Python
. "$HOME/.local/bin/env"
