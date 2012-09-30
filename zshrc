# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# *******************
# Load Theme
# *******************
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rapture"

# *******************
# Example aliases
# *******************
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Custom aliases
#
#Private repo
if [ -e $HOME/dotfiles/aliases.sh ]; then
	source $HOME/dotfiles/aliases.sh
	PATH=$PATH:$HOME/dotfiles/bin
fi

#local aliases/functions
if [ -e $HOME/.aliases.sh ]; then
	source $HOME/dotfiles/aliases.sh
fi
#
#local aliases/functions/PATH etc...
if [ -e $HOME/.localrc ]; then
	source $HOME/.localrc
fi

# *******************
# Custom Keybindings
# *******************
#
# bindkey = '' backward-delete-word

#
# *******************
# oh-my-zsh Custom
# *******************
#
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# *******************
# PLUGINS oh-my-zsh
# *******************
#
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew django osx rvm)

source $ZSH/oh-my-zsh.sh

# *******************
# Set custom PATH
# *******************
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
#
# Customize to your needs...
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/share/python:/usr/local/texlive/2011/bin/x86_64-darwin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/usr/local/Cellar/hadoop/0.21.0/bin:$PATH
