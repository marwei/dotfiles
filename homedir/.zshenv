fpath=($fpath $HOME/.zsh/func)
typeset -U fpath
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"
