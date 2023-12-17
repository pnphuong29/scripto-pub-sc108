# https://github.com/nvm-sh/nvm

export NVM_DIR="${HOME}/.nvm"
ap_node_version="16.20.2"
# ap_node_version="18.16.1"

@logshow "Installing [nvm]\n"
rm -rf "${NVM_DIR}"

(
    git clone https://github.com/nvm-sh/nvm.git "${NVM_DIR}"
    cd "${NVM_DIR}"
    git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1))
) && \. "${NVM_DIR}/nvm.sh"

if [[ -d "${NVM_DIR}" ]]; then
    @logshowpassed "[nvm] has been installed successfully\n"
else
    @logshowfailed "[nvm] has been installed unsuccessfully\n"
fi

# Load nvm
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"                   # This loads-nvm
[ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

if type nvm &>/dev/null; then
    @logshow "Installing [node v${ap_node_version}]\n"
    nvm install "v${ap_node_version}"
    npm install -g npm # Update npm to latest version

    if [[ "$(nvm list default | awk '{print $2}')" == v${ap_node_version}* ]]; then
        @logshowpassed "[node v${ap_node_version}] has been installed successfully\n"
    else
        @logshowfailed "[node v${ap_node_version}] has been installed unsuccessfully\n"
    fi
fi
