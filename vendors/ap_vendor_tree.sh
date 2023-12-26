alias @inittree="ap_func_init_tree"
ap_func_init_tree() {
    @addpath "${AP_SOFT_DIR}/tree"
    alias t='tree -ugpshaC -I .git -I node_modules'                               # list all hidden files & dirs & ignore dirs (.git, etc.)
    alias t1='tree -L 1 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 1 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t2='tree -L 2 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t3='tree -L 3 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t4='tree -L 4 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
    alias t5='tree -L 5 -ugpshaC --metafirst --dirsfirst -I .git -I node_modules' # list level 2 of all hidden files & dirs & ignore dirs (.git, etc.)
}

alias @setuptree="ap_func_setup_tree"
ap_func_setup_tree() {
    @logshow "Install [tree v2.0.2]\n"
    local ap_vendors_tree_dir="${AP_SOFT_DIR}/tree"

    # Remove old tree dir if any
    rm -rf "${ap_vendors_tree_dir}"

    # Install tree
    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/tree/tree-2.0.2.tgz" ]; then
        cp -f "${AP_SCRIPTO_COMMON_DIR}/vendors/tree/tree-2.0.2.tgz" "${AP_TMP_DIR}/"
    else
        curl -LO "ftp://mama.indstate.edu/linux/tree/tree-2.0.2.tgz" # Download very slow, prefer offline file in SC28
    fi

    tar -C "${AP_SOFT_DIR}" -zxf "${AP_TMP_DIR}/tree-2.0.2.tgz"
    mv "${AP_SOFT_DIR}/tree-2.0.2" "${ap_vendors_tree_dir}"
    cd "${ap_vendors_tree_dir}"
    make

    # Man page
    ln -sf "${ap_vendors_tree_dir}/doc/tree.1" "${AP_MAN_DIR}/man1/tree.1"

    @inittree
}

alias @rmtree="ap_func_remove_tree"
ap_func_remove_tree() {
    @logshow "Remove [tree]\n"
    rm -rf "${AP_SOFT_DIR}/tree"
    rm -f "${AP_MAN_DIR}/man1/tree.1"
}
