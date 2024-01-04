alias @initnvm="ap_func_init_nvm"
ap_func_init_nvm() {
    # https://github.com/nvm-sh/nvm
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

    if alias @initnvmshare &>/dev/null; then
        @initnvmshare
    fi

    if alias @initnvmcommon &>/dev/null; then
        @initnvmcommon
    fi
}

alias @createdirstructnvm="ap_func_create_dirstruct_nvm"
ap_func_create_dirstruct_nvm() {
    if alias @createdirstructnvmshare &>/dev/null; then
        @createdirstructnvmshare
    fi

    if alias @createdirstructnvmcommon &>/dev/null; then
        @createdirstructnvmcommon
    fi
}

alias @rmdirstructnvm="ap_func_rm_dirstruct_nvm"
ap_func_rm_dirstruct_nvm() {
    if alias @rmdirstructnvmshare &>/dev/null; then
        @rmdirstructnvmshare
    fi

    if alias @rmdirstructnvmcommon &>/dev/null; then
        @rmdirstructnvmcommon
    fi
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

    @initnvm
    if alias @createdirstructnvm &>/dev/null; then
        @createdirstructnvm
    fi
}

alias @rmnvm="ap_func_rm_nvm"
ap_func_rm_nvm() {
    @logshow "Remove [nvm]\n"
    rm -rf "${HOME}/.nvm"

    if alias @rmdirstructnvm &>/dev/null; then
        @rmdirstructnvm
    fi

    if alias @rmglobalsymlinknvm &>/dev/null; then
        @rmglobalsymlinknvm
    fi
}
