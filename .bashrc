export PS1="\[\033[38;5;118m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;196m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\n-\[$(tput sgr0)\]\[\033[38;5;248m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

alias ös="ls"
alias slloop="~/slloop"
alias rmv="rm -rf"
alias pintoboot="pintos -v --qemu -- run"
alias pintodebug="pintos -v --qemu --gdb -- run"
alias piconnect="ssh pi@192.168.1.180"
set -o vi
export PATH="/Users/malcolm/TDDB68/tddb68-labs/pintos/src/utils/:${PATH}/"
export PATH="${HOME}/TDDB68/tddb68-labs/pintos/src/utils/:${PATH}/"

if [[ "$OSTYPE" == "darwin"* ]]; then
	#alias vim="DYLD_FORCE_FLAT_NAMESPACE=1 /Applications/MacVim.app/Contents/MacOS/Vim"
	export PATH="/Users/malcolm/TDDB68/tddb68-labs/pintos/src/utils/:${PATH}/"
	else
		export PATH="${HOME}/TDDB68/tddb68-labs/pintos/src/utils/:${PATH}/"
		alias emacs="emacs -nw"
		make()
		{
		                                /usr/bin/make "$@" 2>&1 | sed -E -e "s/error/ $(echo -e "\\033[31m" ERROR "\\033[0m"/g)"   -e "s/warning/ $(echo -e "\\033[0;33m" WARNING "\\033[0m"/g)"
		                                                                return ${PIPESTATUS[0]}
		}
	
fi

ltx() {
	pdflatex $1 
	pdflatex $1
	rm *log
	rm *aux
	rm *toc
}

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
alias pmakedisk='pintos-mkdisk fs.dsk 2'
alias pformatdisk='pintos --qemu -v -- -f -q'
alias prun='pintos --qemu -v -- run'
alias pls='pintos --qemu -v -- ls'
alias pcat='pintos --qemu -v -- cat'
alias prm='pintos --qemu -v -- rm'

pintocopy(){
pintos --qemu -p $1 -a $2 -- -q
}
