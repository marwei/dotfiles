# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome
# POWERLEVEL9K_MODE='awesome-patched'
export ZSH_THEME="powerlevel9k/powerlevel9k"

export PATH="/usr/local/opt/curl/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

 POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
 # https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
 # https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
 POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs)
 POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode status history time)
 # colorcode test
 # for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
 POWERLEVEL9K_NVM_FOREGROUND='000'
 POWERLEVEL9K_NVM_BACKGROUND='072'
 POWERLEVEL9K_SHOW_CHANGESET=true
#export ZSH_THEME="random"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# disable colors in ls
# export DISABLE_LS_COLORS="true"

# disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(colorize compleat dirpersist autojump git gulp history cp vi-mode)

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export JAVA_HOME=$(/usr/libexec/java_home)

source /usr/local/opt/nvm/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use &> /dev/null
  elif [[ $(nvm version) != $(nvm version default)  ]]; then
    nvm use default &> /dev/null
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

function new-tmux-from-dir-name {
  dir_name=$(echo `basename $PWD` | tr '.' '-')
  tmux new-session -As $dir_name
}

alias tnew="new-tmux-from-dir-name"

# Customize to your needs...
unsetopt correct

# run fortune on new terminal :)
fortune | cowsay

alias szsh='source ~/.zshrc'
alias vdot='vim ~/.dotfiles && szsh'
alias vzsh='vim ~/.dotfiles/homedir/.zshrc && szsh'
alias vtmux='vim ~/.dotfiles/homedir/.tmux.conf && tmux source-file ~/.tmux.conf'
alias vnb='vim /sandbox/notebook'
alias vhs='vim /Users/marwei/.hammerspoon/'
alias pnb='jupyter notebook'


alias tf='tail -f'
alias k9='kill -9'
alias psgrep='ps aux | grep'
alias p='ipython3'
alias dc='docker-compose'
alias rn='react-native'

eval $(thefuck --alias)

alias rc='rails c --sandbox'
