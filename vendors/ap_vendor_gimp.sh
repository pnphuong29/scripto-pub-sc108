alias apinitgimp="ap_func_init_gimp"
ap_func_init_gimp() {
    if alias apinitgimpshare &>/dev/null; then
        apinitgimpshare
    fi

    if alias apinitgimpcommon &>/dev/null; then
        apinitgimpcommon
    fi

    if alias apinitgimpmain &>/dev/null; then
        apinitgimpmain
    fi
}

alias apcreatedirstructgimp="ap_func_create_dirstruct_gimp"
ap_func_create_dirstruct_gimp() {
    # aplogshow "Generate [gimp] bash autocomplete\n"
    # gimp >"${AP_COMPLETIONS_DIR}/ap_completion_gimp.bash"

    # if [ -f "${HOME}/scripto-share/vendors/gimp/bindings.json" ]; then
    #     aplogshow "Create symlink from [${HOME}/.config/gimp/bindings.json] to [${HOME}/scripto-share/vendors/gimp/bindings.json]\n"
    #     ln -sf "${HOME}/scripto-share/vendors/gimp/bindings.json" "${HOME}/.config/gimp/bindings.json"
    # fi

    # aplogshow "Create symlink from [${AP_SOFT_DIR}/bin/gimp] to [${AP_SOFT_DIR}/gimp/bin/gimp]\n"
    # ln -sf "${AP_SOFT_DIR}/gimp/bin/gimp" "${AP_SOFT_DIR}/bin/gimp"

    # aplogshow "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_gimp.bash] to [${AP_SOFT_DIR}/gimp/complete/gimp.bash]\n"
    # ln -sf "${AP_SOFT_DIR}/gimp/autocomplete/gimp.bash" "${AP_COMPLETIONS_DIR}/ap_completion_gimp.bash"

    # aplogshow "Create symlink from [${AP_MAN_DIR}/man1/gimp.1] to [${AP_SOFT_DIR}/gimp/gimp.1]\n"
    # ln -sf "${AP_SOFT_DIR}/gimp/gimp.1" "${AP_MAN_DIR}/man1/gimp.1"

    if alias apcreatedirstructgimpshare &>/dev/null; then
        apcreatedirstructgimpshare
    fi

    if alias apcreatedirstructgimpcommon &>/dev/null; then
        apcreatedirstructgimpcommon
    fi

    if alias apcreatedirstructgimpmain &>/dev/null; then
        apcreatedirstructgimpmain
    fi
}

alias aprmdirstructgimp="ap_func_rm_dirstruct_gimp"
ap_func_rm_dirstruct_gimp() {
    # aplogshow "Remove [${AP_SOFT_DIR}/bin/gimp]\n"
    # rm -f "${AP_SOFT_DIR}/bin/gimp"

    # aplogshow "Remove [${AP_COMPLETIONS_DIR}/ap_completion_gimp.bash]\n"
    # rm -f "${AP_COMPLETIONS_DIR}/ap_completion_gimp.bash"

    # aplogshow "Remove [${AP_MAN_DIR}/man1/gimp.1]\n"
    # rm -f "${AP_MAN_DIR}/man1/gimp.1"

    if alias aprmdirstructgimpshare &>/dev/null; then
        aprmdirstructgimpshare
    fi

    if alias aprmdirstructgimpcommon &>/dev/null; then
        aprmdirstructgimpcommon
    fi

    if alias aprmdirstructgimpmain &>/dev/null; then
        aprmdirstructgimpmain
    fi
}

alias apsetupgimp="ap_func_setup_gimp"
ap_func_setup_gimp() {
    aplogshow "Install [gimp]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew install --cask gimp
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap install gimp
    fi

    apinitgimp
    if alias apcreatedirstructgimp &>/dev/null; then
        apcreatedirstructgimp
    fi
}

alias aprmgimp="ap_func_rm_gimp"
ap_func_rm_gimp() {
    aplogshow "Remove [gimp]\n"

    if [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_MACOS}" ]; then
        brew remove --cask gimp
    elif [ "${AP_OS_TYPE}" == "${AP_OS_TYPE_UBUNTU}" ]; then
        sudo snap remove --purge gimp
    fi

    if alias aprmdirstructgimp &>/dev/null; then
        aprmdirstructgimp
    fi

    if alias aprmglobalsymlinkgimp &>/dev/null; then
        aprmglobalsymlinkgimp
    fi
}
