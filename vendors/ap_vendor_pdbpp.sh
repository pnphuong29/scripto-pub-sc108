alias @createdirstructpdbpp="ap_func_create_dir_struct_pdbpp"
ap_func_create_dir_struct_pdbpp() {
    if [ -f "${AP_SCRIPTO_COMMON_DIR}/vendors/pdbpp/ap_pdbpp.py" ]; then
        @logshow "Link [${HOME}/.pdbrc.py] to [${AP_SCRIPTO_COMMON_DIR}/vendors/pdbpp/ap_pdbpp.py]\n"
        ln -sf "${AP_SCRIPTO_COMMON_DIR}/vendors/pdbpp/ap_pdbpp.py" "${HOME}/.pdbrc.py"
    fi
}

alias @initpdbpp="ap_func_init_pdbpp"
ap_func_init_pdbpp() {
    alias viscpdbpp="vi -p \
        \${AP_SCRIPTO_COMMON_DIR}/vendors/pdbpp/ap_pdbpp.py
    "
}
