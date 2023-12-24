alias @initnvm="ap_func_init_nvm"
ap_func_init_nvm() {
    # https://github.com/nvm-sh/nvm
    export AP_NODE_VERSION_DEFAULT="16.20.2"
    # AP_NODE_VERSION_DEFAULT="18.16.1"
    export NVM_DIR="${HOME}/.nvm" # NVM's installation directory

    if [ -d "${HOME}/.yarn/bin" ]; then
        @addpath "${HOME}/.yarn/bin"
    fi

    # Load nvm
    [ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"                   # This loads nvm
    [ -s "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

    # where node, npm, and global packages for the active version of node are installed.
    # export NVM_BIN="${NVM_DIR}/bin"

    # node's include file directory (useful for building C/C++ addons for node).
    # export NVM_INC="${NVM_DIR}/inc"

    # version from .nvmrc file if being used.
    # export NVM_RC_VERSION

    # export NVM_COLORS='cmgRY'
}

alias @setupnvm="ap_func_setup_nvm"
ap_func_setup_nvm() {
    # https://github.com/nvm-sh/nvm
    @logshow "Install [nvm]\n"
    export NVM_DIR="${HOME}/.nvm"

    rm -rf "${NVM_DIR}"
    (
        git clone https://github.com/nvm-sh/nvm.git "${NVM_DIR}"
        cd "${NVM_DIR}"
        git checkout $(git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1))
    ) && source "${NVM_DIR}/nvm.sh"

    # Load nvm
    [ -s "${NVM_DIR}/nvm.sh" ] && source "${NVM_DIR}/nvm.sh"                   # This loads-nvm
    [ -s "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion" # This loads nvm bash_completion

    # Install node
    @logshow "Install [node v${AP_NODE_VERSION_DEFAULT}]\n"
    nvm install "v${AP_NODE_VERSION_DEFAULT}"
    npm install -g npm # Update npm to latest version

    @initnvm
}

alias @rmnvm="ap_func_remove_nvm"
ap_func_remove_nvm() {
    @logshow "Remove [nvm]\n"

    [ -f /usr/local/bin/node ] && sudo rm -f /usr/local/bin/node
    [ -f /usr/local/bin/npm ] && sudo rm -f /usr/local/bin/npm
    [ -f /usr/local/bin/yarn ] && sudo rm -f /usr/local/bin/yarn

    rm -rf "${HOME}/.nvm"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_npm.bash"
}
