alias apinityo="ap_func_init_yo"
ap_func_init_yo() {
    alias yolsgenerators="yo --generators"
    alias yodoctor="yo doctor"

    if alias apinityoshare &>/dev/null; then
        apinityoshare
    fi

    if alias apinityocommon &>/dev/null; then
        apinityocommon
    fi

    if alias apinityomain &>/dev/null; then
        apinityomain
    fi
}

alias apcreatedirstructyo="ap_func_create_dirstruct_yo"
ap_func_create_dirstruct_yo() {
    apshowmsginfo "Create symlink from [${AP_COMPLETIONS_DIR}/ap_completion_yo.bash] to [${HOME}/scripto-share/vendors/yo/ap_completion_yo.bash]\n"
    ln -sf "${HOME}/scripto-share/vendors/yo/ap_completion_yo.bash" "${AP_COMPLETIONS_DIR}/ap_completion_yo.bash"

    if alias apcreatedirstructyoshare &>/dev/null; then
        apcreatedirstructyoshare
    fi

    if alias apcreatedirstructyocommon &>/dev/null; then
        apcreatedirstructyocommon
    fi

    if alias apcreatedirstructyomain &>/dev/null; then
        apcreatedirstructyomain
    fi
}

alias aprmdirstructyo="ap_func_rm_dirstruct_yo"
ap_func_rm_dirstruct_yo() {
    apshowmsginfo "Remove [${AP_COMPLETIONS_DIR}/ap_completion_yo.bash]\n"
    rm -f "${AP_COMPLETIONS_DIR}/ap_completion_yo.bash"

    if alias aprmdirstructyoshare &>/dev/null; then
        aprmdirstructyoshare
    fi

    if alias aprmdirstructyocommon &>/dev/null; then
        aprmdirstructyocommon
    fi

    if alias aprmdirstructyomain &>/dev/null; then
        aprmdirstructyomain
    fi
}

# alias apcreateglobalsymlinkyo="ap_func_create_global_symlink_yo"
# ap_func_create_global_symlink_yo() {
#     if [ -f "${AP_SOFT_DIR}/bin/yo" ]; then
#         apshowmsginfo "Create symlink from [/usr/local/bin/yo] to [${AP_SOFT_DIR}/bin/yo]\n"
#         sudo ln -sf "${AP_SOFT_DIR}/bin/yo" "/usr/local/bin/yo"
#     fi
# }

# alias aprmglobalsymlinkyo="ap_func_rm_global_symlink_yo"
# ap_func_rm_global_symlink_yo() {
#     if [ -f "/usr/local/bin/yo" ]; then
#         apshowmsginfo "Remove [/usr/local/bin/yo]\n"
#         sudo rm -f "/usr/local/bin/yo"
#     fi
# }

alias apsetupyo="ap_func_setup_yo"
ap_func_setup_yo() {
    apshowmsginfo "Install [yo]\n"

    pnpm install -g yo generator-code
    apinityo

    if alias apcreatedirstructyo &>/dev/null; then
        apcreatedirstructyo
    fi
}

alias aprmyo="ap_func_rm_yo"
ap_func_rm_yo() {
    apshowmsginfo "Remove [yo]\n"
    pnpm uninstall -g yo generator-code

    if alias aprmdirstructyo &>/dev/null; then
        aprmdirstructyo
    fi

    if alias aprmglobalsymlinkyo &>/dev/null; then
        aprmglobalsymlinkyo
    fi
}
