#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias ls='ls_extended'
alias rm='trash'
alias cat='bat --theme=ansi'
alias l='ls_extended'
alias top='bottom'
alias open='xdg-open'
alias xclip='xclip -sel clip'

eval "$(starship init bash)"
