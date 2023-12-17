@logshow "Removing [nvm]\n"

rm -rf "${HOME}/.nvm"
[[ -f /usr/local/bin/node ]] && sudo rm -f /usr/local/bin/node
[[ -f /usr/local/bin/npm ]] && sudo rm -f /usr/local/bin/npm
[[ -f /usr/local/bin/yarn ]] && sudo rm -f /usr/local/bin/yarn

if ! which nvm &>/dev/null; then
    @logshowpassed "[nvm] has been removed successfully\n"
else
    @logshowfailed "[nvm] has been removed unsuccessfully\n"
fi
