export PS1="\[\033[38;5;118m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\n-\[$(tput sgr0)\]\[\033[38;5;248m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export FFMPEG_BINARY='/usr/local/bin/ffmpeg'
alias rmv="rm -rf"
alias :q="exit"
alias rwfi="sudo service network-manager restart"
alias shit=gdb

stty -ixon
alias makej="make -j12"

set -o vi
ltx() {
	pdflatex $1.tex
    bibtex $1.aux
	pdflatex $1.tex
	pdflatex $1.tex
	rm *log
	rm *aux
	rm *toc
}

alias vim=nvim
alias switch="touch /tmp/switch"

up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
      do
      d=$d/..
      done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
  d=..
  fi
  cd $d
}

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export EDITOR=vim

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:$HOME/raspberrypi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian/bin
export PATH=$PATH:$HOME/pycharm/pycharm-community-2022.2.2/bin

export ARDUINO_DIR=/home/malcolm/.arduino15
export JSON_CPP_DIR=/home/malcolm/Programming/json
. "$HOME/.cargo/env"
export CATCH_DIR=/home/malcolm/Programming/Catch2

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
