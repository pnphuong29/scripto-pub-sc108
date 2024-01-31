alias @initnode="ap_func_init_node"
ap_func_init_node() {
    export AP_NODE_VERSION_DEFAULT="16.20.2"
    # AP_NODE_VERSION_DEFAULT="18.16.1"

    alias npminstall='npm install'
    alias npmuninstall='npm uninstall'
    alias npmbuild='npm run build'
    alias npmserve='npm run serve'

    if alias @initnodeshare &>/dev/null; then
        @initnodeshare
    fi

    if alias @initnodecommon &>/dev/null; then
        @initnodecommon
    fi
}

alias @createdirstructnode="ap_func_create_dirstruct_node"
ap_func_create_dirstruct_node() {
    @logshow "Generate [npm] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_npm.bash]\n"
    npm completion >"${AP_COMPLETIONS_DIR}/ap_completion_npm.bash"

    if alias @createdirstructnodeshare &>/dev/null; then
        @createdirstructnodeshare
    fi

    if alias @createdirstructnodecommon &>/dev/null; then
        @createdirstructnodecommon
    fi
}

alias @rmdirstructnode="ap_func_rm_dirstruct_node"
ap_func_rm_dirstruct_node() {
    @logshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_npm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_npm.bash"

    if alias @rmdirstructnodeshare &>/dev/null; then
        @rmdirstructnodeshare
    fi

    if alias @rmdirstructnodecommon &>/dev/null; then
        @rmdirstructnodecommon
    fi
}

alias @createglobalsymlinknode="ap_func_create_global_symlink_node"
ap_func_create_global_symlink_node() {
    local ap_path
    ap_path="$(nvm which node | cut -d ' ' -f 3)"

    if [ -f "${ap_path}" ]; then
        @logshow "Create symlink from [/usr/local/bin/node] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/node"

        @logshow "Create symlink from [/usr/local/bin/npm] to [${ap_path%/*}/npm]\n"
        sudo ln -sf "${ap_path%/*}/npm" "/usr/local/bin/npm"

        @logshow "Create symlink from [/usr/local/bin/yarn] to [${ap_path%/*}/yarn]\n"
        sudo ln -sf "${ap_path%/*}/yarn" "/usr/local/bin/yarn"
    fi
}

alias @rmglobalsymlinknode="ap_func_rm_global_symlink_node"
ap_func_rm_global_symlink_node() {
    @logshow "Remove [/usr/local/bin/node]\n"
    sudo rm -f "/usr/local/bin/node"

    @logshow "Remove [/usr/local/bin/npm]\n"
    sudo rm -f "/usr/local/bin/npm"

    @logshow "Remove [/usr/local/bin/yarn]\n"
    sudo rm -f "/usr/local/bin/yarn"
}

alias @setupnode="ap_func_setup_node"
ap_func_setup_node() {
    local ap_node_setup_version="${AP_NODE_VERSION_DEFAULT}"
    if [ -n "$1" ]; then
        ap_node_setup_version="$1"
    fi

    @logshow "Install [node v${ap_node_setup_version}]\n"
    nvm install "v${ap_node_setup_version}"
    npm install -g npm # Update npm to latest version

    @initnode
    if alias @createdirstructnode &>/dev/null; then
        @createdirstructnode
    fi
}

alias @rmnode="ap_func_rm_node"
ap_func_rm_node() {
    local ap_node_remove_version="${AP_NODE_VERSION_DEFAULT}"
    if [ -n "$1" ]; then
        ap_node_remove_version="$1"
    fi

    @logshow "Remove [node] v${ap_node_remove_version}\n"
    nvm uninstall "v${ap_node_remove_version}"

    if alias @rmdirstructnode &>/dev/null; then
        @rmdirstructnode
    fi

    if alias @rmglobalsymlinknode &>/dev/null; then
        @rmglobalsymlinknode
    fi
}
