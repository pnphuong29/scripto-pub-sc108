alias apinitnode="ap_func_init_node"
ap_func_init_node() {
    if alias apinitnodeshare &>/dev/null; then
        apinitnodeshare
    fi

    if alias apinitnodecommon &>/dev/null; then
        apinitnodecommon
    fi
}

alias apcreatedirstructnode="ap_func_create_dirstruct_node"
ap_func_create_dirstruct_node() {
    if alias apcreatedirstructnodeshare &>/dev/null; then
        apcreatedirstructnodeshare
    fi

    if alias apcreatedirstructnodecommon &>/dev/null; then
        apcreatedirstructnodecommon
    fi
}

alias aprmdirstructnode="ap_func_rm_dirstruct_node"
ap_func_rm_dirstruct_node() {
    if alias aprmdirstructnodeshare &>/dev/null; then
        aprmdirstructnodeshare
    fi

    if alias aprmdirstructnodecommon &>/dev/null; then
        aprmdirstructnodecommon
    fi
}

alias apcreateglobalsymlinknode="ap_func_create_global_symlink_node"
ap_func_create_global_symlink_node() {
    if [ -d "${FNM_DIR}/aliases/default/bin" ]; then
        aplogshow "Create symlink from [/usr/local/bin/node] to [${FNM_DIR}/aliases/default/bin/node]\n"
        sudo ln -sf "${FNM_DIR}/aliases/default/bin/node" "/usr/local/bin/node"

        aplogshow "Create symlink from [/usr/local/bin/npm] to [${FNM_DIR}/aliases/default/bin/npm]\n"
        sudo ln -sf "${FNM_DIR}/aliases/default/bin/npm" "/usr/local/bin/npm"

        aplogshow "Create symlink from [/usr/local/bin/pnpm] to [${FNM_DIR}/aliases/default/bin/pnpm]\n"
        sudo ln -sf "${FNM_DIR}/aliases/default/bin/pnpm" "/usr/local/bin/pnpm"

        aplogshow "Create symlink from [/usr/local/bin/yarn] to [${FNM_DIR}/aliases/default/bin/yarn]\n"
        sudo ln -sf "${FNM_DIR}/aliases/default/bin/yarn" "/usr/local/bin/yarn"
    fi
}

alias aprmglobalsymlinknode="ap_func_rm_global_symlink_node"
ap_func_rm_global_symlink_node() {
    aplogshow "Remove [/usr/local/bin/node]\n"
    sudo rm -f "/usr/local/bin/node"

    aplogshow "Remove [/usr/local/bin/npm]\n"
    sudo rm -f "/usr/local/bin/npm"

    aplogshow "Remove [/usr/local/bin/pnpm]\n"
    sudo rm -f "/usr/local/bin/pnpm"

    aplogshow "Remove [/usr/local/bin/yarn]\n"
    sudo rm -f "/usr/local/bin/yarn"
}

alias apsetupnode="ap_func_setup_node"
ap_func_setup_node() {
    aplogshow "Install node version [${AP_NODE_VERSION_16}]\n"
    # nvm install "${AP_NODE_VERSION_16}"
    fnm install "${AP_NODE_VERSION_16}"

    aplogshow "Install node version [${AP_NODE_VERSION_18}]\n"
    # nvm install "${AP_NODE_VERSION_18}"
    fnm install "${AP_NODE_VERSION_18}"

    aplogshow "Install node version [${AP_NODE_VERSION_20}]\n"
    # nvm install "${AP_NODE_VERSION_20}"
    fnm install "${AP_NODE_VERSION_20}"

    aplogshow "Install node version [${AP_NODE_VERSION_22}]\n"
    # nvm install "${AP_NODE_VERSION_22}"
    fnm install "${AP_NODE_VERSION_22}"

    aplogshow "Set default node version [${AP_NODE_VERSION_DEFAULT}]\n"
    # nvm alias default "${AP_NODE_VERSION_DEFAULT}"
    fnm default "${AP_NODE_VERSION_DEFAULT}"

    # nvm use "${AP_NODE_VERSION_DEFAULT}"
    fnm use "${AP_NODE_VERSION_DEFAULT}"

    npm install -g pnpm

    echo "${AP_NODE_VERSION_DEFAULT}" >"${HOME}/.node-version"

    # volta install "node@v${ap_node_setup_version}"

    apinitnode
    if alias apcreatedirstructnode &>/dev/null; then
        apcreatedirstructnode
    fi
}

alias aprmnode="ap_func_rm_node"
ap_func_rm_node() {
    aplogshow "Remove node version [${AP_NODE_VERSION_18}]\n"
    # nvm uninstall "${AP_NODE_VERSION_18}"
    fnm uninstall "${AP_NODE_VERSION_18}"

    aplogshow "Remove node version [${AP_NODE_VERSION_20}]\n"
    # nvm uninstall "${AP_NODE_VERSION_20}"
    fnm uninstall "${AP_NODE_VERSION_20}"

    aplogshow "Remove node version [${AP_NODE_VERSION_22}]\n"
    # nvm uninstall "${AP_NODE_VERSION_22}"
    fnm uninstall "${AP_NODE_VERSION_22}"

    # volta uninstall "node@v${ap_node_remove_version}"

    if alias aprmdirstructnode &>/dev/null; then
        aprmdirstructnode
    fi

    if alias aprmglobalsymlinknode &>/dev/null; then
        aprmglobalsymlinknode
    fi
}
