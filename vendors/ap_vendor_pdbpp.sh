alias @createdirstructpdbpp="ap_func_create_dir_struct_pdbpp"
ap_func_create_dir_struct_pdbpp() {
    if [ -f "${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py" ]; then
        @logshow "Link [${HOME}/.pdbrc.py] to [${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py]\n"
        ln -sf "${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py" "${HOME}/.pdbrc.py"
    fi
}

alias @initpdbpp="ap_func_init_pdbpp"
ap_func_init_pdbpp() {
    alias viscpdbpp="vi -p \
        \${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py
    "
}
