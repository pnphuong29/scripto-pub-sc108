alias apinitnvm="ap_func_init_nvm"
ap_func_init_nvm() {
    # https://github.com/nvm-sh/nvm
    export NVM_DIR="${HOME}/.nvm" # NVM's installation directory

    alias nvmuse='nvm use'
    alias nvmversion='nvm version'

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

    alias nvmuse16='nvm use 16'
    alias nvmuse18='nvm use 18'
    alias nvmuse20='nvm use 20'
    alias nvmuse22='nvm use 22'

    alias nvmdefault16='nvm alias default 16'
    alias nvmdefault18='nvm alias default 18'
    alias nvmdefault20='nvm alias default 20'
    alias nvmdefault22='nvm alias default 22'

    if alias apinitnvmshare &>/dev/null; then
        apinitnvmshare
    fi

    if alias apinitnvmcommon &>/dev/null; then
        apinitnvmcommon
    fi
}

alias apcreatedirstructnvm="ap_func_create_dirstruct_nvm"
ap_func_create_dirstruct_nvm() {
    if alias apcreatedirstructnvmshare &>/dev/null; then
        apcreatedirstructnvmshare
    fi

    if alias apcreatedirstructnvmcommon &>/dev/null; then
        apcreatedirstructnvmcommon
    fi
}

alias aprmdirstructnvm="ap_func_rm_dirstruct_nvm"
ap_func_rm_dirstruct_nvm() {
    if alias aprmdirstructnvmshare &>/dev/null; then
        aprmdirstructnvmshare
    fi

    if alias aprmdirstructnvmcommon &>/dev/null; then
        aprmdirstructnvmcommon
    fi
}

alias apsetupnvm="ap_func_setup_nvm"
ap_func_setup_nvm() {
    # https://github.com/nvm-sh/nvm
    aplogshow "Install [nvm]\n"
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

    apinitnvm
    if alias apcreatedirstructnvm &>/dev/null; then
        apcreatedirstructnvm
    fi
}

alias aprmnvm="ap_func_rm_nvm"
ap_func_rm_nvm() {
    aplogshow "Remove [nvm]\n"
    rm -rf "${HOME}/.nvm"

    if alias aprmdirstructnvm &>/dev/null; then
        aprmdirstructnvm
    fi

    if alias aprmglobalsymlinknvm &>/dev/null; then
        aprmglobalsymlinknvm
    fi
}
