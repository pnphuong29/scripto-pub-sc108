alias apinitnode="ap_func_init_node"
ap_func_init_node() {
    export AP_NODE_VERSION_16="16.20.2"
    export AP_NODE_VERSION_18="18.20.5"
    export AP_NODE_VERSION_20="20.18.1"
    export AP_NODE_VERSION_22="22.13.0"
    export AP_NODE_VERSION_DEFAULT="${AP_NODE_VERSION_20}"

    if [ -d "${HOME}/.local/share/pnpm" ]; then
        export PNPM_HOME="${HOME}/.local/share/pnpm"
        apaddpath "${PNPM_HOME}"
    fi

    if [ -d "${HOME}/.yarn/bin" ]; then
        apaddpath "${HOME}/.yarn/bin"
    fi

    # npm
    alias npmi='npm install'
    alias npmid='npm install --save-dev'
    alias npmig='npm install --global'
    alias npmilegacypeerdeps='npm install --legacy-peer-deps'

    alias npmu='npm upgrade'
    alias npmug='npm upgrade --global'

    alias npmls='npm ls'
    alias npmlsg='npm ls -g'

    alias npmrm='npm uninstall'
    alias npmrmg='npm uninstall -g'

    alias npmrun='npm run'
    alias npmclean='npm run clean'
    alias npmlint='npm run lint'
    alias npmtest='npm run test'
    alias npmserve='npm run serve'
    alias npmdev='npm run dev'
    alias npmbuild='npm run build'
    alias npmbuildlegacypeerdeps='npm run build --legacy-peer-deps'
    alias npmbuildtypes='npm run buildTypes'
    alias npmbuildnode='npm run buildNode'
    alias npmbuildnodeswc='npm run buildNodeSwc'
    alias npmbuildesm='npm run buildEsm'
    alias npmbuildesmswc='npm run buildEsmSwc'

    alias npmcreate='npm create'

    # pnpm
    alias pn='pnpm'
    alias pnupdate='pnpm self-update'
    alias pnversion='pnpm --version'
    alias pnfilter='pnpm --filter'
    alias pnx='pnpm exec'
    alias pndl='pnpm dlx'

    alias pni='pnpm install'
    alias pnig='pnpm install --global'

    alias pna='pnpm add'
    alias pnad='pnpm add -D'

    alias pnls='pnpm ls'
    alias pnlsg='pnpm ls --global'

    alias pnrm='pnpm rm'
    alias pnrmg='pnpm rm --global'

    alias pnrun='pnpm run'
    alias pnclean='pnpm run clean'
    alias pnlint='pnpm run lint'
    alias pntest='pnpm run test'
    alias pnserve='pnpm run serve'
    alias pndev='pnpm run dev'
    alias pnbuild='pnpm run build'
    alias pnbuildlegacypeerdeps='pnpm run build --legacy-peer-deps'
    alias pnbuildtypes='pnpm run buildTypes'
    alias pnbuildnode='pnpm run buildNode'
    alias pnbuildnodeswc='pnpm run buildNodeSwc'
    alias pnbuildesm='pnpm run buildEsm'
    alias pnbuildesmswc='pnpm run buildEsmSwc'

    if alias apinitnodeshare &>/dev/null; then
        apinitnodeshare
    fi

    if alias apinitnodecommon &>/dev/null; then
        apinitnodecommon
    fi
}

alias apcreatedirstructnode="ap_func_create_dirstruct_node"
ap_func_create_dirstruct_node() {
    aplogshow "Generate [npm] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_npm.bash]\n"
    npm completion >"${AP_COMPLETIONS_DIR}/ap_completion_npm.bash"

    aplogshow "Generate [pnpm] bash autocomplete at [${AP_COMPLETIONS_DIR}/ap_completion_pnpm.bash]\n"
    pnpm completion bash >"${AP_COMPLETIONS_DIR}/ap_completion_pnpm.bash"

    if alias apcreatedirstructnodeshare &>/dev/null; then
        apcreatedirstructnodeshare
    fi

    if alias apcreatedirstructnodecommon &>/dev/null; then
        apcreatedirstructnodecommon
    fi
}

alias aprmdirstructnode="ap_func_rm_dirstruct_node"
ap_func_rm_dirstruct_node() {
    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_npm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_npm.bash"

    aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_pnpm.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_pnpm.bash"

    if alias aprmdirstructnodeshare &>/dev/null; then
        aprmdirstructnodeshare
    fi

    if alias aprmdirstructnodecommon &>/dev/null; then
        aprmdirstructnodecommon
    fi
}

alias apcreateglobalsymlinknode="ap_func_create_global_symlink_node"
ap_func_create_global_symlink_node() {
    local ap_path
    ap_path="$(nvm which node | cut -d ' ' -f 3)"
    # ap_path="$(which node | cut -d ' ' -f 3)"

    if [ -f "${ap_path}" ]; then
        aplogshow "Create symlink from [/usr/local/bin/node] to [${ap_path}]\n"
        sudo ln -sf "${ap_path}" "/usr/local/bin/node"

        aplogshow "Create symlink from [/usr/local/bin/npm] to [${ap_path%/*}/npm]\n"
        sudo ln -sf "${ap_path%/*}/npm" "/usr/local/bin/npm"

        aplogshow "Create symlink from [/usr/local/bin/yarn] to [${ap_path%/*}/yarn]\n"
        sudo ln -sf "${ap_path%/*}/yarn" "/usr/local/bin/yarn"
    fi
}

alias aprmglobalsymlinknode="ap_func_rm_global_symlink_node"
ap_func_rm_global_symlink_node() {
    aplogshow "Remove [/usr/local/bin/node]\n"
    sudo rm -f "/usr/local/bin/node"

    aplogshow "Remove [/usr/local/bin/npm]\n"
    sudo rm -f "/usr/local/bin/npm"

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
