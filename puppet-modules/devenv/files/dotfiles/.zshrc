# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alberto/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR='vim'

source "/opt/devenv/antigen/antigen.zsh"

antigen use oh-my-zsh

# bundles from oh-my-zsh
antigen bundle bower
antigen bundle bundler
antigen bundle command-not-found
antigen bundle dirhistory
antigen bundle gem
antigen bundle git
antigen bundle history
antigen bundle node
antigen bundle npm
antigen bundle rsync
antigen bundle sublime
antigen bundle sudo
antigen bundle vagrant

# Other
antigen bundle zsh-users/zsh-completions src
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv

antigen-theme agnoster
antigen-apply

eval `dircolors ~/.dircolors-solarized/dircolors.ansi-dark`