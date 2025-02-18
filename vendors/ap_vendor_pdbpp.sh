alias apinitpdbpp="ap_func_init_pdbpp"
ap_func_init_pdbpp() {
    alias viscpdbpp="vi -p \
        \${HOME}/scripto/vendors/ap_vendor_pdbpp.sh \
        \${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py \
    "

    if alias apinitpdbppshare &>/dev/null; then
        apinitpdbppshare
    fi

    if alias apinitpdbppcommon &>/dev/null; then
        apinitpdbppcommon
    fi
}

alias apcreatedirstructpdbpp="ap_func_create_dir_struct_pdbpp"
ap_func_create_dir_struct_pdbpp() {
    if [ -f "${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py" ]; then
        aplogshow "Link [${HOME}/.pdbrc.py] to [${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py]\n"
        ln -sf "${HOME}/scripto-common/vendors/pdbpp/ap_pdbpp.py" "${HOME}/.pdbrc.py"
    fi
}

alias aprmdirstructpdbpp="ap_func_rm_dirstruct_pdbpp"
ap_func_rm_dirstruct_pdbpp() {
    aplogshow "Remove [${HOME}/.pdbrc.py]\n"
    rm -f "${HOME}/.pdbrc.py"

    if alias aprmdirstructpdbppshare &>/dev/null; then
        aprmdirstructpdbppshare
    fi

    if alias aprmdirstructpdbppcommon &>/dev/null; then
        aprmdirstructpdbppcommon
    fi
}

alias apsetuppdbpp="ap_func_setup_pdbpp"
ap_func_setup_pdbpp() {
    aplogshow "Install [pdbpp]\n"
    pip install pdbpp

    apinitpdbpp
    if alias apcreatedirstructpdbpp &>/dev/null; then
        apcreatedirstructpdbpp
    fi
}

alias aprmpdbpp="ap_func_rm_pdbpp"
ap_func_rm_pdbpp() {
    aplogshow "Remove [pdbpp]\n"
    pip uninstall pdbpp

    if alias aprmdirstructpdbpp &>/dev/null; then
        aprmdirstructpdbpp
    fi

    if alias aprmglobalsymlinkpdbpp &>/dev/null; then
        aprmglobalsymlinkpdbpp
    fi
}
