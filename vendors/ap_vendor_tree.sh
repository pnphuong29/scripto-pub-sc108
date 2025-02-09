alias apinittree="ap_func_init_tree"
ap_func_init_tree() {
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

alias aprmdirstructtree="ap_func_rm_dirstruct_tree"
ap_func_rm_dirstruct_tree() {
    aplogshow "Remove [${AP_SOFT_DIR}/bin/tree]\n"
    rm -f "${AP_SOFT_DIR}/bin/tree"

    aplogshow "Remove [${AP_MAN_DIR}/man1/tree.1]\n"
    rm -f "${AP_MAN_DIR}/man1/tree.1"

    if alias aprmdirstructtreeshare &>/dev/null; then
        aprmdirstructtreeshare
    fi

    if alias aprmdirstructtreecommon &>/dev/null; then
        aprmdirstructtreecommon
    fi
}

alias apcreateglobalsymlinktree="ap_func_create_global_symlink_tree"
ap_func_create_global_symlink_tree() {
    if [ -f "${AP_SOFT_DIR}/bin/tree" ]; then
        aplogshow "Create symlink from [/usr/local/bin/tree] to [${AP_SOFT_DIR}/bin/tree]\n"
        sudo ln -sf "${AP_SOFT_DIR}/bin/tree" "/usr/local/bin/tree"
    fi
}

alias aprmglobalsymlinktree="ap_func_rm_global_symlink_tree"
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
    apcreateglobalsymlinktree

    if alias apcreatedirstructtree &>/dev/null; then
        apcreatedirstructtree
    fi
}

alias aprmtree="ap_func_rm_tree"
ap_func_rm_tree() {
    aplogshow "Remove [tree]\n"

    rm -rf "${AP_SOFT_DIR}/tree"
    rm -f "${AP_MAN_DIR}/man1/tree.1"

    if alias aprmdirstructtree &>/dev/null; then
        aprmdirstructtree
    fi

    if alias aprmglobalsymlinktree &>/dev/null; then
        aprmglobalsymlinktree
    fi
}
