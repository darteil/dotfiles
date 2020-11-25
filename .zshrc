export ZSH="/home/darteil/.oh-my-zsh"

ZSH_THEME="my-theme"

plugins=(vi-mode tmux)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim;

export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
    [[ $1 = 'block' ]]; then
  echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
    [[ ${KEYMAP} == viins ]] ||
    [[ ${KEYMAP} = '' ]] ||
    [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

zle -N zle-keymap-select

zle-line-init() {
  zle -K viins
  echo -ne "\e[5 q"
}

zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}


alias ll='lsd -lAhS --blocks permission,group,size,date,name  --date relative --group-dirs first'
alias mus='mpsyt pl "https://www.youtube.com/playlist?list=PLbu6xrylxwhUD2V5BMRuKh00fgdlLJ-zT"'
alias tmdef='tmux attach -t default'
alias mountdata='sudo mount -t ntfs-3g /dev/sdb1 /mnt/data'
alias pulserestart='pulseaudio -k'
alias fontsreload='sudo fc-cache -f -v'

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{node_modules,.git}"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

