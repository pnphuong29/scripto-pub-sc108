alias @initpdbpp="ap_func_init_pdbpp"
ap_func_init_pdbpp() {
    alias viscpdbpp="vi -p \
        \${HOME}/scripto/vendors/ap_vendor_pdbpp.sh \
        \${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py \
    "

    if alias @initpdbppshare &>/dev/null; then
        @initpdbppshare
    fi

    if alias @initpdbppcommon &>/dev/null; then
        @initpdbppcommon
    fi
}

alias @createdirstructpdbpp="ap_func_create_dir_struct_pdbpp"
ap_func_create_dir_struct_pdbpp() {
    if [ -f "${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py" ]; then
        @logshow "Link [${HOME}/.pdbrc.py] to [${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py]\n"
        ln -sf "${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py" "${HOME}/.pdbrc.py"
    fi
}

alias @rmdirstructpdbpp="ap_func_rm_dirstruct_pdbpp"
ap_func_rm_dirstruct_pdbpp() {
    @logshow "Remove [${HOME}/.pdbrc.py]\n"
    rm -f "${HOME}/.pdbrc.py"

    if alias @rmdirstructpdbppshare &>/dev/null; then
        @rmdirstructpdbppshare
    fi

    if alias @rmdirstructpdbppcommon &>/dev/null; then
        @rmdirstructpdbppcommon
    fi
}

alias @setuppdbpp="ap_func_setup_pdbpp"
ap_func_setup_pdbpp() {
    @logshow "Install [pdbpp]\n"
    pip install pdbpp

    @initpdbpp
    if alias @createdirstructpdbpp &>/dev/null; then
        @createdirstructpdbpp
    fi
}

alias @rmpdbpp="ap_func_rm_pdbpp"
ap_func_rm_pdbpp() {
    @logshow "Remove [pdbpp]\n"
    pip uninstall pdbpp

    if alias @rmdirstructpdbpp &>/dev/null; then
        @rmdirstructpdbpp
    fi

    if alias @rmglobalsymlinkpdbpp &>/dev/null; then
        @rmglobalsymlinkpdbpp
    fi
}
