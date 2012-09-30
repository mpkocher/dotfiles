# Aliases that should work under bash and zsh

alias cdd='cd ..'
alias cddd='cd ../..'

#
if [ `uname` = 'Darwin' ]; then
	#set MacVIM
	VIM='/Applications/MacVim.app/Contents/MacOS/Vim'
	alias vim=$VIM
	alias vi=$VIM
	#get last opened file from VIM
	#alias vv="$VIM -c \"normal '0\""
	export EDITOR=$VIM
	#export RUBYLIB=$HOME/Dropbox/ruby
	#PYTHONPATH?
	#cctbx VARS
fi
