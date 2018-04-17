setopt auto_cd
setopt auto_pushd
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt no_share_history
setopt prompt_subst
setopt pushd_ignore_dups
setopt pushd_to_home
setopt transient_rprompt

typeset -ga precmd_functions

unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

HISTFILE=${HOME}/.history
HISTSIZE=8192
SAVEHIST=8192

autoload -Uz colors     && colors
autoload -Uz compinit   && compinit
autoload -Uz promptinit && promptinit
autoload -Uz vcs_info   && vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%F{236}(%F{81}%b%F{100}%c%u%F{236})'
zstyle ':vcs_info:*' stagedstr '✘'
zstyle ':vcs_info:*' unstagedstr '✗'

precmd_functions+='vcs_info'

PROMPT='%m%F{81}:%F{246}%64<...<%~${vcs_info_msg_0_}%F{246}$%F{reset} '
RPROMPT='%F{236}(%F{81}%*%F{236})%F{reset}'

fpath=(/usr/local/share/zsh/site-functions $fpath)

alias b="bundle-hack"
alias be="bundle exec"
alias reado="\`~/bin/ssh-reagent\`"

bindkey -e

[[ -s "$HOME/.localrc" ]] && source "$HOME/.localrc"

# Needed for Swiftype
export PKG_CONFIG_PATH="/usr/local/opt/libxml2/lib/pkgconfig" PATH="/usr/local/opt/libxml2/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#TODO I use zsh
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Jenv, like rbenv for java runtimes
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
