#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias cdd='cd ..'
alias simple-server="python -m SimpleHTTPServer"
alias pretty-json="python -m json.tool"
alias cats='highlight -O ansi'
alias ccat='highlight -O ansi'

# stop using vim
export EDITOR="/usr/local/bin/emacsclient -c"
alias ec="/usr/local/bin/emacsclient -c"
# using a raw call to emacsclient will open a the currently opened window/frame.
alias et="/usr/local/bin/emacsclient -t"
alias vim="/usr/local/bin/emacsclient -t"
alias vi="/usr/local/bin/emacsclient -t"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
export POSTGRES_BIN_PATH=/Applications/Postgres.app/Contents/Versions/latest/bin
export WORKON_HOME="${HOME}/miniconda3/envs"
export PATH="${HOME}/bin:${JAVA_HOME}/bin:${POSTGRES_BIN_PATH}:${PATH}:${HOME}/.local/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mkocher/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mkocher/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/mkocher/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mkocher/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

