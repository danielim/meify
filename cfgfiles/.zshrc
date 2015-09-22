#paths
export ANDROID_HOME=/home/daniel/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

#imports
source ~/.zsh/keybind.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/alias.zsh

#enable cmd history
export HISTSIZE=100
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd

## History
HISTFILE=$HOME/.zhistory       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=2000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

#load nvm
export NVM_DIR="/home/daniel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Print date before command executes
preexec() { date }


#force ibus to behave with android-studio
IBUS_ENABLE_SYNC_MODE=1 ibus-daemon -xrd

bindkey '^R' history-incremental-search-backward
