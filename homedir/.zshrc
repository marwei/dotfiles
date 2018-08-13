# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
# if you want to use this, change your non-ascii font to Droid Sans Mono for Awesome
# POWERLEVEL9K_MODE='awesome-patched'
export ZSH_THEME="powerlevel9k/powerlevel9k"

# added by Anaconda3 4.3.1 installer
export PATH="/Users/weizhu/anaconda3/bin:$PATH"

export PATH="/crunchbase/ops_tools/bin:$PATH"

export PATH="/crunchbase/ops_docker/bin:$PATH"

export PATH="/sandbox/vendor/confluent/bin:$PATH"

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# # https://github.com/bhilburn/powerlevel9k#customizing-prompt-segments
# # https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(virtualenv dir vcs vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status history time)
# # colorcode test
# # for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
# POWERLEVEL9K_NVM_FOREGROUND='000'
# POWERLEVEL9K_NVM_BACKGROUND='072'
# POWERLEVEL9K_SHOW_CHANGESET=true
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
# fortune | cowsay

eval "$(thefuck --alias)"

# git shorthands
alias gop="git remote get-url origin | sed 's/git@/http:\/\//' | sed 's/com:/com\//' | xargs open"

# bash shorthands
alias szsh='source ~/.zshrc'
alias vzsh='vim ~/.dotfiles/homedir/.zshrc && szsh'
alias vtmux='vim ~/.dotfiles/homedir/.tmux.conf && tmux source-file ~/.tmux.conf'
alias vnb='cd /sandbox/notebook && vim'
alias vhs='vim /Users/weizhu/.hammerspoon/'

# unix shorthands
alias tf='tail -f'
alias k9='kill -9'
alias kz='k9 %1'
alias psgrep='ps aux | grep'

# directory shortcuts
alias cc='cd /crunchbase'
alias cs='cd /sandbox'
alias ccdocker='cd /crunchbase/ops_docker'
alias ccda='cd         /crunchbase/data_airflow'
alias csda='cd /sandbox/crunchbase/data_airflow'
alias ccdc='cd         /crunchbase/data_config'
alias csdc='cd /sandbox/crunchbase/data_config'
alias ccdf='cd         /crunchbase/data_framework'
alias csdf='cd /sandbox/crunchbase/data_framework'
alias ccds='cd         /crunchbase/data_sentinel'
alias csds='cd /sandbox/crunchbase/data_sentinel'
alias ccdu='cd         /crunchbase/data_util'
alias csdu='cd /sandbox/crunchbase/data_util'
alias ccdbw='cd         /crunchbase/data_builtwith'
alias csdbw='cd /sandbox/crunchbase/data_builtwith'
alias ccdsw='cd         /crunchbase/data_similarweb'
alias csdsw='cd /sandbox/crunchbase/data_similarweb'
alias ccdat='cd         /crunchbase/data_apptopia'
alias csdat='cd /sandbox/crunchbase/data_apptopia'
alias ccdiq='cd         /crunchbase/data_ipqwery'
alias csdiq='cd /sandbox/crunchbase/data_ipqwery'
alias ccdbb='cd         /crunchbase/data_bombora'
alias csdbb='cd /sandbox/crunchbase/data_bombora'
alias ccdow='cd         /crunchbase/data_owler'
alias csdow='cd /sandbox/crunchbase/data_owler'
alias ccdn='cd         /crunchbase/data_news'
alias csdn='cd /sandbox/crunchbase/data_news'
alias ccdna='cd         /crunchbase/data_news_analytics'
alias csdna='cd /sandbox/crunchbase/data_news_analytics'
alias ccdip='cd         /crunchbase/data_investor_predictor'
alias csdip='cd /sandbox/crunchbase/data_investor_predictor'
alias csdu='cd /sandbox/crunchbase/data_util'
alias ccms='cd         /crunchbase/metadata-service'
alias csms='cd /sandbox/crunchbase/metadata-service'
alias ccmu='cd         /crunchbase/metadata-ui'
alias csmu='cd /sandbox/crunchbase/metadata-ui'
alias ccsoa='cd         /crunchbase/seal_of_approval'
alias cssoa='cd /sandbox/crunchbase/seal_of_approval'

alias csconfluent='cd /sandbox/vendor/confluent'
alias rdi='~/bin/run_data_infra.sh'
alias rdn='~/bin/run_data_news.sh'
alias rdbw='~/bin/run_data_builtwith.sh'

# python shorthands
alias p='ipython3'
alias pnb='cd /sandbox/playground/jupyter && jupyter notebook'

# docker shorthands
alias dc='docker-compose'

# python shortcuts
alias nt='nosetests'
function ve {
  if [ $1 = 'new' ]; then
    virtualenv .env
  elif [ $1 = 'on' ]; then
    source .env/bin/activate
  elif [ $1 = 'off' ]; then
    deactivate
  else
    echo 'Unknown parameter' $1
  fi
}

# scala shortcuts
alias st='sbt test'

# other shortcuts
alias kke="ps aux | grep [k]arabiner | awk '{print \$2}' | xargs sudo kill -9"
alias prt='parrot --delay 50'
alias lgrep='ls -la | grep'
alias pc='pbcopy'
alias rd='r53-dig'
alias ljs='lumberjack -es'
alias ljp='lumberjack -ep'

alias gstagegateway="r53-dig gateway-private-cb3.stage.crunchbase | awk '{print \$4}'"
alias gprodgateway="r53-dig gateway-private-cb3.prod.crunchbase | awk '{print \$4}'"
alias gstagekafka="r53-dig kafka.stage.crunchbase | awk '{print \$4}' | head -n 1"
alias gprodkafka="r53-dig kafka.prod.crunchbase | awk '{print \$4}' | head -n 1"
alias stagekibana="/sandbox/vendor/kibana-5.2.2/bin/kibana -e http://172.25.11.228:9200 -p 5602 & sleep 5 && open -a '/Applications/Google Chrome.app/' 'http://localhost:5602'"
alias prodkibana="/sandbox/vendor/kibana-5.2.2/bin/kibana -e http://172.17.12.220:9200 -p 5603 & sleep 5 && open -a '/Applications/Google Chrome.app/' 'http://localhost:5603'"

alias seal="ccsoa && SEAL_ORGANISATION=crunchbase GITHUB_TOKEN=616abb9b9f1fa33b37ccd11162cca6d5dbfe21b2 SLACK_WEBHOOK=https://hooks.slack.com/services/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 ruby bin/seal.rb /crunchbase/seal_of_approval/config/crunchbase.yml"
alias lastcmd="history | tail -n 1 | cut -d' ' -f3-"
alias cplastcmd="echo \`lastcmd\` | pc && echo copied \"\\"\"\`lastcmd\`\"\\"\""

source /workspace/dotfiles/.zshrc

function flaskrun {
  FLASK_APP=$1 FLASK_DEBUG=1 flask run
}

function gstageentitydb {
  r53-dig entityservice-postgres.rel$1.stage.crunchbase  | awk '{print $4}'
}

function gstagesetldb {
  r53-dig streaming-postgres.rel$1.stage.crunchbase | awk '{print $4}'
}
