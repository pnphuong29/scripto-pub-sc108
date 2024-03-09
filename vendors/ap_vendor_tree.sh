alias apinittree="ap_func_init_tree"
ap_func_init_tree() {
    alias t='tree -ugpshaC -I .git -I node_modules'                               # list all hidden files & dirs & ignore dirs (.git, etc.)
    alias t1='tree -L 1 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 1 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t2='tree -L 2 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t3='tree -L 3 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t4='tree -L 4 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t5='tree -L 5 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)

    if alias apinittreeshare &>/dev/null; then
        apinittreeshare
    fi

    if alias apinittreecommon &>/dev/null; then
        apinittreecommon
    fi
}

alias apcreatedirstructtree="ap_func_create_dirstruct_tree"
ap_func_create_dirstruct_tree() {
    aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/tree] to [${AP_SOFT_DIR}/tree/tree]\n"
    ln -sf "${AP_SOFT_DIR}/tree/tree" "${AP_SOFT_DIR}/bin/tree"

    aplogshow "Create symlink from [${AP_MAN_DIR}/man1/tree.1] to [${AP_SOFT_DIR}/tree/doc/tree.1]\n"
    ln -sf "${AP_SOFT_DIR}/tree/doc/tree.1" "${AP_MAN_DIR}/man1/tree.1"

    if alias apcreatedirstructtreeshare &>/dev/null; then
        apcreatedirstructtreeshare
    fi

    if alias apcreatedirstructtreecommon &>/dev/null; then
        apcreatedirstructtreecommon
    fi
}

alias rmdirstructtree="ap_func_rm_dirstruct_tree"
ap_func_rm_dirstruct_tree() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/tree]\n"
    rm -f "${AP_SOFT_DIR}/bin/tree"

    aplogshow "Remove [${AP_MAN_DIR}/man1/tree.1]\n"
    rm -f "${AP_MAN_DIR}/man1/tree.1"

    if alias rmdirstructtreeshare &>/dev/null; then
        rmdirstructtreeshare
    fi

    if alias rmdirstructtreecommon &>/dev/null; then
        rmdirstructtreecommon
    fi
}

alias @createglobalsymlinktree="ap_func_create_global_symlink_tree"
ap_func_create_global_symlink_tree() {
    if [ -f "${AP_SOFT_DIR}/bin/tree" ]; then
        aplogshow "Create symlink from [/usr/local/bin/tree] to [${AP_SOFT_DIR}/bin/tree]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/tree" "/usr/local/bin/tree"
    fi
}

alias rmglobalsymlinktree="ap_func_rm_global_symlink_tree"
ap_func_rm_global_symlink_tree() {
    if [ -f "/usr/local/bin/tree" ]; then
        aplogshow "Remove [/usr/local/bin/tree]\n"
        sudo rm -f "/usr/local/bin/tree"
    fi
}

alias apsetuptree="ap_func_setup_tree"
ap_func_setup_tree() {
    aplogshow "Install [tree v2.0.2]\n"
    local ap_vendors_tree_dir="${AP_SOFT_DIR}/tree"

    # Remove old tree dir if any
    rm -rf "${ap_vendors_tree_dir}"

    # Install tree
    if [ -f "${HOME}/scripto-share/vendors/tree/tree-2.0.2.tgz" ]; then
        cp -f "${HOME}/scripto-share/vendors/tree/tree-2.0.2.tgz" "${AP_TMP_DIR}/"
    else
        curl -LO "ftp://mama.indstate.edu/linux/tree/tree-2.0.2.tgz" # Download very slow, prefer offline file in SC28
    fi

    tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/tree-2.0.2.tgz"
    mv "${AP_SOFT_DIR}/tree-2.0.2" "${ap_vendors_tree_dir}"
    cd "${ap_vendors_tree_dir}"
    make

    # Man page
    ln -sf "${ap_vendors_tree_dir}/doc/tree.1" "${AP_MAN_DIR}/man1/tree.1"

    apinittree
    if alias apcreatedirstructtree &>/dev/null; then
        apcreatedirstructtree
    fi
}

alias rmtree="ap_func_rm_tree"
ap_func_rm_tree() {
    aplogshow "Remove [tree]\n"

    rm -rf "${AP_SOFT_DIR}/tree"
    rm -f "${AP_MAN_DIR}/man1/tree.1"

    if alias rmdirstructtree &>/dev/null; then
        rmdirstructtree
    fi

    if alias rmglobalsymlinktree &>/dev/null; then
        rmglobalsymlinktree
    fi
}
