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
alias top='btm'
alias open='xdg-open'
alias xclip='xclip -sel clip'
alias code='antigravity'

eval "$(starship init bash)"

export PATH="$PATH:/home/sduwal/SDK/flutter/bin"
export PATH="$PATH:/home/sduwal/Android/Sdk/platform-tools"

# Java Environment Configurations
export JAVA_HOME=/opt/android-studio/jbr
export PATH=$JAVA_HOME/bin:$PATH
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
