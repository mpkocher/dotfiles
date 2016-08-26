# Aliases that should work under bash and zsh
alias cdd='cd ..'
alias cddd='cd ../..'

# Require python2.7
alias simple-server="python -m SimpleHTTPServer"
alias pretty-json="python -m json.tool"

# Update pip packages in VE
function update_ve_pkgs() {
    echo "Updating pip packages"
    for i in $(pip freeze | tr "==" " " | awk '{print $1}') ; do pip install --upgrade $i; done
}

function get_ammonite() {
    echo "Getting Ammonite"
    curl -L -o $HOME/bin/amm https://git.io/v6KE6 && chmod +x $HOME/bin/amm
}
